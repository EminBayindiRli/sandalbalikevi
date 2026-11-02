-- Sandal Balık Evi · Müşterinin 01.11.2026 içerik mesajı
-- Supabase → SQL Editor'a yapıştırıp Run'a basın. Tekrar çalıştırmak zararsızdır.
-- Alerjeni NULL olan ürünlerde teyit bekleniyor (sülfit/gluten/kuruyemiş sorusu); menüde alerjen gösterilmez, içindekiler gösterilir.
begin;

-- 1) Menüdeki 23 ürünün içerik ve alerjenleri
update public.items set ingredients_tr = 'Rendelenmiş kavrulmuş kabak, süzme yoğurt, sarımsak, zeytinyağı, karabiber, kimyon, kekik, tuz', ingredients_en = 'Grated sautéed courgette, strained yoghurt, garlic, olive oil, black pepper, cumin, thyme, salt', allergens = '{sut}'::text[]
  where name_tr = 'Girit kabağı' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Süzme yoğurt, kuru domates, rendelenmiş havuç, sarımsak, zeytinyağı, ceviz, tuz', ingredients_en = 'Strained yoghurt, sun-dried tomatoes, grated carrot, garlic, olive oil, walnuts, salt', allergens = null
  where name_tr = 'Ege meze' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Semizotu, süzme yoğurt, sarımsak, zeytinyağı, sirke, tuz', ingredients_en = 'Purslane, strained yoghurt, garlic, olive oil, vinegar, salt', allergens = null
  where name_tr = 'Semizotu' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Küp doğranmış salatalık, süzme yoğurt, sarımsak, zeytinyağı, tuz', ingredients_en = 'Diced cucumber, strained yoghurt, garlic, olive oil, salt', allergens = '{sut}'::text[]
  where name_tr = 'Kuru cacık' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Deniz börülcesi, sarımsak, zeytinyağı', ingredients_en = 'Samphire, garlic, olive oil', allergens = '{}'::text[]
  where name_tr = 'Deniz börülcesi' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Kuru bakla, kuru soğan, havuç, zeytinyağı, limon, şeker, tuz', ingredients_en = 'Dried broad beans, onion, carrot, olive oil, lemon, sugar, salt', allergens = '{}'::text[]
  where name_tr = 'Sade fava' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Ezine peyniri, tulum peyniri, tatlı lor, fesleğen sos, krema, zeytinyağı, kekik, kimyon, karabiber', ingredients_en = 'Ezine cheese, tulum cheese, fresh curd cheese, basil sauce, cream, olive oil, thyme, cumin, black pepper', allergens = null
  where name_tr = 'Girit peyniri' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Turp otu, zeytinyağı, limon, tuz', ingredients_en = 'Radish greens, olive oil, lemon, salt', allergens = '{}'::text[]
  where name_tr = 'Turp otu' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Cibez, zeytinyağı, limon, tuz', ingredients_en = 'Cibez (wild greens), olive oil, lemon, salt', allergens = '{}'::text[]
  where name_tr = 'Cibez' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Brokoli, zeytinyağı, limon, tuz', ingredients_en = 'Broccoli, olive oil, lemon, salt', allergens = '{}'::text[]
  where name_tr = 'Brokoli' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Bebek enginar, sirke, sarımsak, pul biber, kekik, zeytinyağı, tuz', ingredients_en = 'Baby artichokes, vinegar, garlic, chilli flakes, thyme, olive oil, salt', allergens = null
  where name_tr = 'Bebek enginar' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Rendelenmiş pancar, yeşil elma, maydanoz, nar ekşisi, Marzemik sirkesi, zeytinyağı, tuz', ingredients_en = 'Grated beetroot, green apple, parsley, pomegranate molasses, Marzemik vinegar, olive oil, salt', allergens = null
  where name_tr = 'Pancar' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Levrek, zeytinyağı, limon, tuz', ingredients_en = 'Sea bass, olive oil, lemon, salt', allergens = '{balik}'::text[]
  where name_tr = 'Levrek marin' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'İslenmiş levrek, çemen, zeytinyağı, tuz', ingredients_en = 'Smoked sea bass, çemen spice paste, olive oil, salt', allergens = '{balik}'::text[]
  where name_tr = 'İsli levrek' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Nohut, tahin, zeytinyağı, limon, elma sirkesi, kimyon, karabiber, tuz', ingredients_en = 'Chickpeas, tahini, olive oil, lemon, apple cider vinegar, cumin, black pepper, salt', allergens = null
  where name_tr = 'Humus' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Kızartılmış patlıcan, domates sos, sirke, zeytinyağı, şeker, tuz', ingredients_en = 'Fried aubergine, tomato sauce, vinegar, olive oil, sugar, salt', allergens = null
  where name_tr = 'Şakşuka' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Domates, salatalık, yeşil biber, peynir', ingredients_en = 'Tomato, cucumber, green pepper, cheese', allergens = '{sut}'::text[]
  where name_tr = 'Komple söğüş' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Az yağlı Ezine peyniri', ingredients_en = 'Low-fat Ezine white cheese', allergens = '{sut}'::text[]
  where name_tr = 'Peynir' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Izgara köy peyniri', ingredients_en = 'Grilled village cheese', allergens = '{sut}'::text[]
  where name_tr = 'Sıcak peynir' and category_id = (select id from public.categories where name_tr = 'Ara sıcaklar');
update public.items set ingredients_tr = 'Patlıcan, yoğurt, domates sos, sarımsak, şeker, tuz', ingredients_en = 'Aubergine, yoghurt, tomato sauce, garlic, sugar, salt', allergens = '{sut}'::text[]
  where name_tr = 'Köpoğlu' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Karides, salatalık turşusu, maydanoz, yeşil biber, zeytinyağı, limon, tuz', ingredients_en = 'Shrimp, pickled cucumber, parsley, green pepper, olive oil, lemon, salt', allergens = null
  where name_tr = 'Karides söğüş' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Ahtapot, kapya biber, salatalık turşusu, zeytinyağı, limon, tuz', ingredients_en = 'Octopus, red pepper, pickled cucumber, olive oil, lemon, salt', allergens = null
  where name_tr = 'Ahtapot salatası' and category_id = (select id from public.categories where name_tr = 'Mezeler');
update public.items set ingredients_tr = 'Midye, pirinç, maydanoz, dereotu, karabiber, tuz', ingredients_en = 'Mussels, rice, parsley, dill, black pepper, salt', allergens = '{yumusakca}'::text[]
  where name_tr = 'Midye dolma' and category_id = (select id from public.categories where name_tr = 'Mezeler');

-- 2) Menüye eklenen 12 yeni ürün (fiyatlar panelden girilecek)
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Hardal soslu levrek marin', 'Marinated sea bass with mustard sauce', 'Marine levrek, hardal, mayonez, bal, dereotu, kuru soğan', 'Marinated sea bass, mustard, mayonnaise, honey, dill, onion', '{balik,hardal,yumurta}'::text[], null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Hardal soslu levrek marin' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Cunda meze', 'Cunda meze', 'Kapya biber sos, Ezine peyniri, maydanoz, nar ekşisi, zeytinyağı, kekik, pul biber, kimyon', 'Red pepper sauce, Ezine cheese, parsley, pomegranate molasses, olive oil, thyme, chilli flakes, cumin', '{sut}'::text[], null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Cunda meze' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Hardallı patlıcan dövme', 'Pounded aubergine with mustard', 'Patlıcan, hardal, sarımsak, zeytinyağı, şeker, tuz', 'Aubergine, mustard, garlic, olive oil, sugar, salt', '{hardal}'::text[], null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Hardallı patlıcan dövme' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Patlıcan salatası', 'Aubergine salad', 'Patlıcan, kapya biber, Ezine peyniri, maydanoz, sarımsak, limon, elma sirkesi, tuz', 'Aubergine, red pepper, Ezine cheese, parsley, garlic, lemon, apple cider vinegar, salt', null, null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Patlıcan salatası' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Kuru domatesli mantar salatası', 'Mushroom salad with sun-dried tomatoes', 'Mantar, kapya biber, kuru domates, nar ekşisi, kekik, pul biber, sebze çeşnisi, zeytinyağı', 'Mushrooms, red pepper, sun-dried tomatoes, pomegranate molasses, thyme, chilli flakes, vegetable seasoning, olive oil', null, null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Kuru domatesli mantar salatası' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Yörük ezme', 'Yörük ezme (spicy bulgur dip)', 'Bulgur, salatalık, domates, kuru soğan, maydanoz, nane, nar ekşisi, acı biber salçası, vişne suyu, sarımsak, sirke, zeytinyağı, tuz', 'Bulgur, cucumber, tomato, onion, parsley, mint, pomegranate molasses, hot pepper paste, sour cherry juice, garlic, vinegar, olive oil, salt', null, null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Yörük ezme' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Antep acılı ezme', 'Antep spicy ezme', 'Domates, salatalık, yeşil acı sivri biber, kuru soğan, maydanoz, nane, nar ekşisi, acı biber salçası, sarımsak, kimyon, pul biber, tuz', 'Tomato, cucumber, hot green pepper, onion, parsley, mint, pomegranate molasses, hot pepper paste, garlic, cumin, chilli flakes, salt', '{}'::text[], null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Antep acılı ezme' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Karışık turşu', 'Mixed pickles', 'Lahana turşusu, salatalık turşusu', 'Pickled cabbage, pickled cucumber', null, null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Karışık turşu' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Pancar turşusu', 'Pickled beetroot', 'Pancar, sirke, sarımsak, şeker, tuz', 'Beetroot, vinegar, garlic, sugar, salt', null, null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Pancar turşusu' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Kaya koruğu', 'Rock samphire', 'Kaya koruğu, sirke, sarımsak, tuz', 'Rock samphire, vinegar, garlic, salt', null, null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Kaya koruğu' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Mezeler'), 'Brüksel lahanası', 'Brussels sprouts', null, null, null, null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Mezeler')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Brüksel lahanası' and category_id = (select id from public.categories where name_tr = 'Mezeler'));
insert into public.items (category_id, name_tr, name_en, ingredients_tr, ingredients_en, allergens, price, available, featured, theme, callouts, sort)
  select (select id from public.categories where name_tr = 'Ara sıcaklar'), 'Sakanaki', 'Saganaki (grilled cheese)', 'Izgara peynir', 'Grilled cheese', null, null, true, false, 'sea', '[]'::jsonb,
         coalesce((select max(sort) from public.items where category_id = (select id from public.categories where name_tr = 'Ara sıcaklar')), 0) + 1
  where not exists (select 1 from public.items where name_tr = 'Sakanaki' and category_id = (select id from public.categories where name_tr = 'Ara sıcaklar'));

commit;

-- 3) MÜŞTERİ TEYİDİNDEN SONRA: aşağıdaki eşleşmeler doğruysa satırın başındaki -- işaretlerini kaldırıp çalıştırın
-- "Yoğurtlu patlıcan ezme" = "Patlıcanlı yoğurt" ise:
-- update public.items set ingredients_tr = 'Süzme yoğurt, közlenmiş patlıcan, sarımsak, zeytinyağı, tuz', ingredients_en = 'Strained yoghurt, fire-roasted aubergine, garlic, olive oil, salt', allergens = '{sut}'::text[] where name_tr = 'Patlıcanlı yoğurt' and category_id = (select id from public.categories where name_tr = 'Mezeler');
-- "Köz biber" = "Kırmızı biber" ise:
-- update public.items set ingredients_tr = 'Közlenmiş biber, sirke, zeytinyağı, limon, sarımsak, tuz', ingredients_en = 'Roasted pepper, vinegar, olive oil, lemon, garlic, salt', allergens = null where name_tr = 'Kırmızı biber' and category_id = (select id from public.categories where name_tr = 'Mezeler');
-- "Çıtır enginar" = "Enginar" ise:
-- update public.items set ingredients_tr = 'Enginar, bal, hardal, sarımsak, sirke, yumurta sarısı, zeytinyağı, tuz', ingredients_en = 'Artichoke, honey, mustard, garlic, vinegar, egg yolk, olive oil, salt', allergens = null where name_tr = 'Enginar' and category_id = (select id from public.categories where name_tr = 'Mezeler');
-- "Zeytinli kuru domates" = "Kuru domates" ise:
-- update public.items set ingredients_tr = 'Kuru domates, ızgara zeytin, zeytinyağı, kekik, pul biber', ingredients_en = 'Sun-dried tomatoes, grilled olives, olive oil, thyme, chilli flakes', allergens = null where name_tr = 'Kuru domates' and category_id = (select id from public.categories where name_tr = 'Mezeler');
-- "Karagöz" = "Kuru börülce" ise:
-- update public.items set ingredients_tr = 'Kuru börülce, salatalık turşusu, kapya biber, maydanoz, dereotu, sarımsak, zeytinyağı, limon, sirke, karabiber, tuz', ingredients_en = 'Black-eyed peas, pickled cucumber, red pepper, parsley, dill, garlic, olive oil, lemon, vinegar, black pepper, salt', allergens = null where name_tr = 'Kuru börülce' and category_id = (select id from public.categories where name_tr = 'Mezeler');
