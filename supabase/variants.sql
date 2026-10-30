-- Sandal Balık Evi · Porsiyon seçenekleri (Az / Normal, Tek / Duble / Üçlü / Dörtlü ...)
-- Supabase → SQL Editor'a yapıştırıp Run'a basın. Tekrar çalıştırmak zararsızdır.
--
-- Her ürünün "variants" alanı bir liste tutar, örn:
--   [{"tr":"Az","en":"Small","price":250},{"tr":"Normal","en":"Regular","price":330}]
-- Liste boşsa ürün eskisi gibi tek fiyatla görünür. Doluysa ilk seçeneğin fiyatı
-- "price" alanına da yazılır (sıralama ve eski ekranlar için).

alter table public.items add column if not exists variants jsonb not null default '[]'::jsonb;

alter table public.items drop constraint if exists items_variants_is_array;
alter table public.items add constraint items_variants_is_array check (jsonb_typeof(variants) = 'array');

-- PostgREST şema önbelleğini yenile (panel yeni alanı hemen görsün)
notify pgrst, 'reload schema';
