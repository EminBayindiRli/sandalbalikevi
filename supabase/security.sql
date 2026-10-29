-- Sandal Balık Evi · Güvenlik kuralları (RLS)
-- Supabase → SQL Editor'a yapıştırıp Run'a basın. Tekrar tekrar çalıştırılabilir.
--
-- Kural özeti:
--   * Herkes (ziyaretçiler) menüyü, kategorileri ve ayarları SADECE OKUYABİLİR.
--   * Yalnızca admins tablosunda e-postası olan, giriş yapmış kullanıcılar yazabilir.
--   * admins tablosunu kimse API'den değiştiremez; giriş yapan kişi sadece kendi satırını görebilir.
--   * "dishes" fotoğraf kovasına yalnızca adminler yükleyip silebilir; en fazla 5 MB, sadece resim.

begin;

-- Yardımcı fonksiyon: oturumdaki kullanıcı admin mi?
create or replace function public.is_admin()
returns boolean
language sql stable security definer
set search_path = public
as $$
  select exists (
    select 1 from public.admins a
    where lower(a.email) = lower(auth.jwt() ->> 'email')
  ) and auth.role() = 'authenticated';
$$;
revoke all on function public.is_admin() from public, anon;
grant execute on function public.is_admin() to authenticated;

-- RLS her tabloda açık olsun
alter table public.categories enable row level security;
alter table public.items      enable row level security;
alter table public.settings   enable row level security;
alter table public.admins     enable row level security;

-- Eski (bilinmeyen) politikaları kaldır, aşağıda temizce yeniden yazılıyor
do $$
declare p record;
begin
  for p in select schemaname, tablename, policyname from pg_policies
           where schemaname = 'public' and tablename in ('categories','items','settings','admins')
  loop
    execute format('drop policy %I on %I.%I', p.policyname, p.schemaname, p.tablename);
  end loop;
  for p in select policyname from pg_policies
           where schemaname = 'storage' and tablename = 'objects'
             and (coalesce(qual,'') ilike '%dishes%' or coalesce(with_check,'') ilike '%dishes%')
  loop
    execute format('drop policy %I on storage.objects', p.policyname);
  end loop;
end $$;

-- Ziyaretçiler: sadece okuma
create policy "public read" on public.categories for select to anon, authenticated using (true);
create policy "public read" on public.items      for select to anon, authenticated using (true);
create policy "public read" on public.settings   for select to anon, authenticated using (true);

-- Adminler: yazma
create policy "admin write" on public.categories for all to authenticated using (public.is_admin()) with check (public.is_admin());
create policy "admin write" on public.items      for all to authenticated using (public.is_admin()) with check (public.is_admin());
create policy "admin write" on public.settings   for all to authenticated using (public.is_admin()) with check (public.is_admin() and id = 1);

-- admins: kişi sadece kendi satırını görür (panel girişte bunu kontrol ediyor)
create policy "self read" on public.admins for select to authenticated
  using (lower(email) = lower(auth.jwt() ->> 'email'));

-- Tablo yetkileri: ziyaretçi rolü hiçbir koşulda yazamasın (RLS'ye ek ikinci kilit)
revoke insert, update, delete, truncate on public.categories, public.items, public.settings from anon;
revoke all on public.admins from anon;
revoke insert, update, delete, truncate on public.admins from authenticated;

-- Aktarım sırasında oluşan yedek tabloları API'ye kapat
do $$
begin
  if to_regclass('public.backup_items') is not null then
    execute 'alter table public.backup_items enable row level security';
    execute 'revoke all on public.backup_items from anon, authenticated';
  end if;
  if to_regclass('public.backup_categories') is not null then
    execute 'alter table public.backup_categories enable row level security';
    execute 'revoke all on public.backup_categories from anon, authenticated';
  end if;
end $$;

-- Fotoğraf kovası: herkese açık okuma (public URL), sadece admin yazma, boyut/tür sınırı
update storage.buckets
   set public = true,
       file_size_limit = 5242880,
       allowed_mime_types = array['image/webp','image/png','image/jpeg']
 where id = 'dishes';

create policy "dishes admin insert" on storage.objects for insert to authenticated
  with check (bucket_id = 'dishes' and public.is_admin());
create policy "dishes admin update" on storage.objects for update to authenticated
  using (bucket_id = 'dishes' and public.is_admin()) with check (bucket_id = 'dishes' and public.is_admin());
create policy "dishes admin delete" on storage.objects for delete to authenticated
  using (bucket_id = 'dishes' and public.is_admin());
create policy "dishes admin list" on storage.objects for select to authenticated
  using (bucket_id = 'dishes' and public.is_admin());

commit;

-- Kontrol (sonuçta her tabloda rowsecurity = true görünmeli):
-- select tablename, rowsecurity from pg_tables where schemaname = 'public';
-- select tablename, policyname, roles, cmd from pg_policies where schemaname in ('public','storage') order by 1,2;
