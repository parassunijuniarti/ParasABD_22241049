-- Nama :  PARAS SUNI JUNIARTI
-- Nim : 22241049
-- Modul 6

-- menggunakan database
use undikma_mart;

-- soal 1 tampilkan hanya 5 nama produk yang memiliki pendapatan(revenue) penjualan terbaynyak*/

-- soal 2 
/*tampilkan hanya 3 kategori produk, dan total pendapatan(revenue) yang berstatus target Achived dengan ketentuan:
jika revenue >=900000 = target Achived
jika revenue <900000 = less perfomance
jika tidak keduanya = follow update
NB: pakai case, dan join
*/
-- soal 3
/*jika hari ini adalah tanggal 30 juni 2020 maka berikan informasi 3 nama produk yang paling lama tidak dibeli oleh pelanggan
(dalam hari) wajib menggunakan JOIN*/

-- jawaban No 1
SELECT nama_produk, SUM(qty * (harga - (diskon_persen / 100) * harga)) AS revenue
FROM tr_penjualan_dqlab
GROUP BY nama_produk
ORDER BY revenue DESC LIMIT 5;

-- jawaban no 2
SELECT 
    p.kode_pelanggan, 
    COUNT(p.kode_transaksi) AS total_order, 
    SUM(p.qty) AS total_quantity, 
    SUM(p.harga * p.qty) AS revenue,
    CASE 
        WHEN SUM(p.harga * p.qty) >= 900000 THEN 'Target Achieved'
        WHEN SUM(p.harga * p.qty) < 900000 THEN 'less performance'
        ELSE 'follow update'
    END AS remark
FROM 
    tr_penjualan_dqlab p
GROUP BY 
    p.kode_pelanggan
ORDER BY 
    CASE 
        WHEN SUM(p.harga * p.qty) >= 900000 THEN 1
        WHEN SUM(p.harga * p.qty) < 900000 THEN 2
        ELSE 3
    END, 
    revenue DESC
LIMIT 3;

-- jawaban no 3
SELECT mpd.nama_produk,
datediff(('2020-06-30'), MAX(tpd.tgl_transaksi)) AS days_since_last_purchase
FROM ms_produk_dqlab AS mpd
LEFT JOIN tr_penjualan_dqlab AS tpd ON mpd.kode_produk = tpd.kode_produk
GROUP BY mpd.nama_produk
ORDER BY days_since_last_purchase DESC
LIMIT 3;

