-- Nama : Paras Suni Juniarti
-- Nim : 22241049
-- Modul 3

-- menggunakan database
use undikma_mart;

-- Order BY
-- Mengambil kolom nama produk dan qty dari penjualan urutkan berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty;

-- mengambil kolom nama produk dan qty dari penjualan urutkan berdasarkan qty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty, nama_produk;

-- Latihan dengan mencoba berbagai pengurutan dengan ORDER BY dengan kriteria berikut
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama-pelanggan;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;


-- Mengambil kolom nama produk dan qty dari penjualan urutkan berdasarkan qty dari besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty DESC;

-- mengambil kolom nama produk dan qty dari penjualan urutkan berdasarkan qty dan nama produk besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty DESC, nama_produk DESC;

-- Latihan dengan mencoba berbagai pengurutan dengan ORDER BY dengan kriteria berikut
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC;
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama-pelanggan DESC;
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;

-- mengambil nama produk, qty, harga dan total bayar urutkan berdasarkan total bayar besar ke kecil
SELECT nama_produk, qty, harga, qty*harga AS total_bayar
FROM tr_penjualan_dqlab
ORDER BY total_bayar DESC;

-- latihan 2
SELECT nama_produk, qty, harga,
		diskon_persen, (diskon_persen/100)*harga AS diskon,
        qty*(harga - (diskon_persen/100)*harga) AS total_bayar
FROM tr_penjualan_dqlab
ORDER BY total_bayar DESC;

-- no 1
SELECT * FROM tr_penjualan_dqlab
WHERE diskon_persen > 0
ORDER BY harga DESC;

-- no 2
SELECT nama_produk, qty, harga
FROM tr_penjualan_dqlab
WHERE harga >= 100000
ORDER BY harga DESC;

-- no 3
SELECT nama_produk, qty, harga
FROM tr_penjualan_dqlab
WHERE harga <= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;

-- FUNGSI AGREGASI
-- hitung total qty dari tabel penjualan
SELECT sum(qty) FROM tr_penjualan_dqlab;

-- hitung seluruh row dari tabel penjualan
SELECT count(*) FROM tr_penjualan_dqlab;

-- hitung jumlah qty dan jumlah row dari tabel penjualan
SELECT SUM(qty) AS total_qty, count(*) AS total_row FROM tr_penjualan_dqlab;

-- hitung rata-rata niali maksimun dan nilai minimundari qty tabel penjualan
SELECT AVG(qty), MAX(qty), MIN(qty)
FROM tr_penjualan_dqlab;

-- hitung nilai unik dar nama produk di tabel penjualan
SELECT count(distinct nama_produk) FROM tr_penjualan_dqlab;

-- menampilkan jumlah seluruh row dan jumlah unik dari nama produk dari tabel penjualan
SELECT count(*), count(distinct nama_produk) FROM tr_penjualan_dqlab;

SELECT count(*), count(distinct nama_produk), nama_produk FROM tr_penjualan_dqlab;

-- GROUP BY
-- dikelompokan nilai dari nama produk di tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab GROUP BY nama_produk;

-- dikelompokan nilai dari dari nama produk dan qty di tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan_dqlab GROUP BY nama_produk, qty;

-- GROUP BY + Fungsi Agregasi
-- ambil jumlah qty dari hasil pengelompokkkan nama_produk di tabel penjualan
SELECT nama_produk, sum(qty)
FROM tr_penjualan_dqlab
GROUP BY nama_produk
ORDER BY sum(qty) DESC;

-- HAVING
-- mengambil jumlah qty > 2 dari hasil pengelompokan nama produk
SELECT nama_produk, sum(qty)
FROM tr_penjualan_dqlab
HAVING sum(qty) > 2
ORDER BY sum(qty) DESC;

-- daftar nama produk yang total jumlah produk terjual perkelompok nama produk di atas nilai 4
SELECT nama_produk, sum(qty)
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING sum(qty) > 4
ORDER BY sum(qty) DESC;

-- daftar kelompok nama produk dan total penjualan
SELECT nama_produk, sum(qty)*(harga-(diskon_persen/100)*harga)
AS total_bayar
FROM tr_penjualan_dqlab
GROUP BY nama_produk
ORDER BY total_bayar;
