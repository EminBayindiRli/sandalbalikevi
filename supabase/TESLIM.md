# Teslim adımları

## 1. Supabase (SQL Editor) — bu sırayla
1. `menu_import.sql` → mevcut menüyü `backup_*` tablolarına yedekler, Akinsoft'tan aktarılan 15 kategori / 265 ürünü yükler, test duyurusunu temizler.
2. `security.sql` → RLS kurallarını sıfırdan yazar: ziyaretçi sadece okur, yalnızca `admins` tablosundaki e-postalar yazar; foto kovası 5 MB / sadece resim.

## 2. Supabase paneli (SQL ile yapılamayanlar)
- Authentication → Sign In / Providers → Email → **"Allow new users to sign up" KAPALI** (şu an açık: herkes hesap açabiliyor).
- Authentication → URL Configuration → Site URL `https://sandalbalikevi.org`, Redirect URLs `https://sandalbalikevi.org/panel/` (şifre sıfırlama bağlantısı için).

## 3. Masalardaki QR kodlar ve Instagram
- Masalardaki QR kodları ve Instagram bio linki hâlâ Akinsoft'u açıyor. Yeni hedef: `https://sandalbalikevi.org/qr/?masa=<masa no>`.

## 4. İşletmenin kontrol etmesi gerekenler
- **Hukuki çelişki:** Menü altında "servis veya kuver ücreti alınmaz" yazıyor, ama Rakılar'da "Alkol servisi 1.150 ₺" var. Biri düzeltilmeli.
- Rakılar'daki "35 VİSKİ 2.450 ₺" aktarılmadı; Viskiler'de "Viski 35 cl 1.450 ₺" var. Doğru fiyat hangisi?
- Köfte (bir buçuk) 1.275 ₺, Köfte (duble) 865 ₺: fiyatlar ters olabilir.
- Fiyatı olmayan ürünler menüde "Sorunuz" diye görünür: Tüp kalamar, Çupra ızgara, Levrek ızgara, Levrek lokum, Dana kuzu kıyma, Çerez, Humus, İsli levrek, Paket ızgara balık.
- Tahmin edilen kısaltmalar (panelden düzeltilebilir): Y.EFE → Efe, M.BEYLERBEYİ → Mavi Beylerbeyi, ALTIN → Altın Seri, S.KUZU KAVURMA → Sac kuzu kavurma, P.SAUVIGNON BLANC ANFORA → Sauvignon Blanc Anfora.
- Aynı ürün iki kategoride farklı fiyatla duruyor: Aquadis, Levrek sarma, Balık pastırma (Ara sıcak / Meze). Midye dolma ve fiyatsız Karışık ızgara tekrarları silindi.
- **Alerjen bilgisi hiçbir üründe yok.** Panelde ürün açılıp "Alerjen bilgisi kontrol edildi" işaretlenene kadar menüde alerjen gösterilmez.
- Ana sayfadaki balık mevsimleri yaklaşık; işletmeyle teyit edilmeli.
