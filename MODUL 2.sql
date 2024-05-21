-- Nama : Paras Suni Juniarti
-- Nim : 22241049
-- Modul 2

-- Menggunakan Database
use undikma_mart;

-- Nilai Literal Angka
SELECT 77;
SELECT 77 as angka;

-- Menampilkan beberapa nilai literal dengan tipe data berbeda
SELECT 77 as angka,
true as nilai_logika,
'UNDIKMA' as teks;

-- NULL
-- Menampilkan NULL
SELECT NULL as kosong;

-- Operator Matematika
-- kalkuasi ekspresi matematika
SELECT 5%2 as Sisa_bagi,
5/2 as hasil_bagi_1,
5 DIV 2 as hasil_bagi_2;

-- Latihan
SELECT 4*2 as "(4_dikali_2 )",
(4*8)%7,
(4*8) MOD 7;

-- menampilkan total belanja
SELECT qty*harga AS Total_belanja
FROM tr_penjualan_dqlab;

-- OPERATOR PERBANDINGAN
-- melakukan operator perbandingan
SELECT 5 = 5, 5 <> 5, 5 <> 4, 5 != 5, 5 != 4, 5 > 4;

-- latihan 2
SELECT 1 = true,
1 = false,
5>=5,
5.2=5.20000,
NULL = 1,
NULL = NULL;

-- FUNGSI
SELECT pow(3,2),
round(3,14), round(3.54),
round(3.155), round(3.155, 2),
floor(4.28), floor(4.78),
ceiling(4.39), ceiling(4.55);

SELECT now(), year(now()),
datediff(now(), '2004-06-17'), day ('2004-06-17');

-- latihan 3
SELECT datediff('2004-12-02', now()),
year('2004-12-02'),
month('2004-12-02'),
day('2004-12-02'),
year(now());

-- selisih hari antara tgl penjualan terakhir dengan hari ini
SELECT datediff(now(), tgl_transaksi) FROM tr_penjualan_dqlab;

-- Filtering with WHERE
SELECT nama_produk, qty
FROM tr_penjualan_dqlab
WHERE qty > 3;