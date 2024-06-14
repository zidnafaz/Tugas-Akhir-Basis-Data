CREATE TABLE pelanggan (
    id_pelanggan CHAR(5) NOT NULL PRIMARY KEY,
    nama_pelanggan VARCHAR(50) NOT NULL,
    no_telp VARCHAR(50) NOT NULL,
    alamat VARCHAR(50) NOT NULL
);

CREATE TABLE karyawan (
    id_karyawan CHAR(5) NOT NULL PRIMARY KEY,
    nama_karyawan VARCHAR (50) NOT NULL,
    no_telp VARCHAR (50) NOT NULL,
    jenis_kelamin ENUM ('Laki-Laki', 'Perempuan'),
    id_jabatan CHAR(5) NOT NULL,
    Foreign Key (id_jabatan) REFERENCES jabatan(id_jabatan)
);

CREATE TABLE ongkir (
    kode_ongkir CHAR(3) NOT NULL PRIMARY KEY,
    nama_daerah VARCHAR (50) NOT NULL,
    biaya DECIMAL (10,2) NOT NULL
);

CREATE TABLE layanan (
    id_layanan CHAR(5) NOT NULL PRIMARY KEY,
    nama_layanan VARCHAR (50) NOT NULL,
    estimasi_hari INTEGER NOT NULL,
    biaya_per_kg DECIMAL (10,2) NOT NULL
);

CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan CHAR(5) NOT NULL,
    kode_ongkir CHAR(3) NOT NULL,
    tgl_masuk DATE DEFAULT CURRENT_DATE,
    tgl_keluar DATE,
    keterangan ENUM ('Ambil Ditempat', 'Pesan Antar') NOT NULL,
    id_kasir CHAR(5) NOT NULL,
    id_operasional CHAR(5) NOT NULL,
    id_kurir CHAR(5),
    total_bayar DECIMAL (10,2),
    status ENUM ('Diproses', 'Siap Antar', 'Siap Diambil', 'Selesai') DEFAULT 'Diproses',
    metode_pembayaran ENUM ('Qris', 'Cash') NOT NULL,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (kode_ongkir) REFERENCES ongkir(kode_ongkir),
    FOREIGN KEY (id_kasir) REFERENCES karyawan(id_karyawan),
    FOREIGN KEY (id_kurir) REFERENCES karyawan(id_karyawan),
    FOREIGN KEY (id_operasional) REFERENCES karyawan(id_karyawan)
);

CREATE TABLE detail_transaksi (
    id_detail_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_layanan CHAR(5) NOT NULL,
    berat_per_kg DECIMAL (10,2) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi),
    FOREIGN KEY (id_layanan) REFERENCES layanan(id_layanan)
);

CREATE TABLE jabatan (
    id_jabatan CHAR(5) PRIMARY KEY NOT NULL,
    nama_jabatan VARCHAR(255) NOT NULL,
    gaji DECIMAL(10, 2)
);

INSERT INTO layanan (id_layanan, nama_layanan, estimasi_hari, biaya_per_kg) 
VALUES 
('CK001', 'Cuci Kering Kilat', 1 , 9000),
('CK002', 'Cuci Kering Regular', 3 , 6000),
('CS001', 'Cuci Setrika Kilat', 1 , 11000),
('CS002', 'Cuci Setrika Regular', 3 , 8000),
('SL001', 'Cuci Seprai / Selimut', 3 , 13000),
('SL002', 'Cuci Bed Cover', 4 , 15000),
('BK001', 'Cuci Boneka / Bantal', 3 , 10000),
('SP001', 'Cuci Sepatu', 4 , 35000);

INSERT INTO ongkir (kode_ongkir, nama_daerah, biaya) 
VALUES
('AJS', 'Arjosari', 13000.00),
('BJS', 'Balearjosari', 13000.00),
('BLB', 'Blimbing', 10000.00),
('BNR', 'Bunulrejo', 13000.00),
('JDP', 'Jodipan', 13000.00),
('KST', 'Kesatrian', 13000.00),
('PDW', 'Pandanwangi', 13000.00),
('PLH', 'Polehan', 15000.00),
('PLW', 'Polowijen', 10000.00),
('PWT', 'Purwantoro', 10000.00),
('PWD', 'Purwodadi', 10000.00),
('DNY', 'Dinoyo', 6000.00),
('JTM', 'Jatimulyo', 6000.00),
('KTW', 'Ketawanggede', 6000.00),
('LWK', 'Lowokwaru', 6000.00),
('MJS', 'Merjosari', 8000.00),
('MJL', 'Mojolangu', 6000.00),
('SBS', 'Sumbersari', 10000.00),
('TSM', 'Tasikmadu', 10000.00),
('TLM', 'Tlogomas', 8000.00),
('TLR', 'Tulusrejo', 6000.00),
('TGW', 'Tunggulwulung', 6000.00),
('TJS', 'Tunjungsekar', 8000.00),
('NOT', 'Ditempat', 0.00);

INSERT INTO karyawan (id_karyawan, nama_karyawan, no_telp, jenis_kelamin, id_jabatan) 
VALUES
('K001', 'Indah', '08545354869', 'Perempuan', 'KA'),
('K002', 'Nabil', '08545359645', 'Laki-laki', 'KA'),
('K003', 'Irul', '08545354169', 'Laki-laki', 'KR'),
('K004', 'Dewi', '08545355429', 'Perempuan', 'KR'),
('K005', 'Agus', '08545357610', 'Laki-laki', 'OP'),
('K006', 'Sulis', '08545357603', 'Perempuan', 'OP');

INSERT INTO jabatan (id_jabatan, nama_jabatan, gaji) 
VALUES 
('KA', 'Kasir', 2800000),
('KR', 'Kurir', 2400000),
('OP', 'Operasional', 2600000);

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, no_telp, alamat) 
VALUES
('P001', 'Budi Santoso', '081234567890', 'Jalan Bunga Melati No. 1'),
('P002', 'Siti Aminah', '081234567891', 'Jalan Bunga Mawar No. 2'),
('P003', 'Agus Prabowo', '081234567892', 'Jalan Bunga Kamboja No. 3'),
('P004', 'Dewi Lestari', '081234567893', 'Jalan Bunga Kenanga No. 4'),
('P005', 'Rudi Hartono', '081234567894', 'Jalan Bunga Tulip No. 5'),
('P006', 'Mira Ananda', '081234567895', 'Jalan Bunga Anggrek No. 6'),
('P007', 'Hendra Wijaya', '081234567896', 'Jalan Bunga Matahari No. 7'),
('P008', 'Lia Kusuma', '081234567897', 'Jalan Bunga Bakung No. 8'),
('P009', 'Fajar Ramadhan', '081234567898', 'Jalan Bunga Dahlia No. 9'),
('P010', 'Yuni Kartika', '081234567899', 'Jalan Bunga Melur No. 10'),
('P011', 'Satria Bril', '81234567532', 'Jln. Kembang Turi 12'),
('P012', 'Bima Jaka', '81234569816', 'Jin.Semanggi 20'),
('P013', 'Justin Hubner', '81234566351', 'Jln. Gugus Jaya 27'),
('P014', 'Evan Dimas', '81234560729', 'Jln. Anggrek 13'),
('P015', 'Adelia Syahrani', '81234567627', 'Jln. Kembang Turi 8');

INSERT INTO transaksi (id_pelanggan, kode_ongkir, tgl_masuk, tgl_keluar, keterangan, id_kasir, id_operasional, id_kurir, total_bayar, status, metode_pembayaran)
VALUES
('P001', 'AJS', '2024-05-01', '2024-05-05', 'Pesan Antar', 'K001', 'K005', 'K003', 95000, 'Diproses', 'Cash'),
('P002', 'BJS', '2024-05-03', '2024-05-06', 'Pesan Antar', 'K002', 'K006', 'K004', 31000, 'Siap Antar', 'Qris'),
('P003', 'NOT', '2024-05-04', '2024-05-05', 'Ambil Ditempat', 'K001', 'K005', NULL, 27000, 'Siap Diambil', 'Cash'),
('P004', 'BNR', '2024-05-05', '2024-05-08', 'Pesan Antar', 'K001', 'K005', 'K003', 45000, 'Selesai', 'Cash'),
('P005', 'NOT', '2024-05-06', '2024-05-09', 'Ambil Ditempat', 'K002', 'K006', NULL, 26000, 'Siap Diambil', 'Qris'),
('P006', 'KST', '2024-05-07', '2024-05-11', 'Pesan Antar', 'K001', 'K005', 'K003', 43000, 'Selesai', 'Cash'),
('P007', 'PDW', '2024-05-08', '2024-05-11', 'Pesan Antar', 'K002', 'K006', 'K004', 43000, 'Diproses', 'Qris'),
('P008', 'NOT', '2024-05-09', '2024-05-13', 'Ambil Ditempat', 'K002', 'K006', NULL, 70000, 'Siap Diambil', 'Cash'),
('P009', 'NOT', '2024-05-10', '2024-05-11', 'Ambil Ditempat', 'K001', 'K005', NULL, 27000, 'Diproses', 'Qris'),
('P010', 'PWT', '2024-05-11', '2024-05-12', 'Pesan Antar', 'K001', 'K005', 'K003', 54000, 'Siap Antar', 'Cash'),
('P011', 'TGW', '2024-05-19', '2024-05-22', 'Pesan Antar', 'K001', 'K005', 'K003', 36000, 'Diproses', 'Cash'),
('P012', 'DNY', '2024-05-24', '2024-05-25', 'Pesan Antar', 'K002', 'K006', 'K004', 28000, 'Siap Antar', 'Qris'),
('P013', 'KTW', '2024-05-24', '2024-05-28', 'Pesan Antar', 'K001', 'K005', 'K003', 51000, 'Diproses', 'Qris'),
('P014', 'NOT', '2024-06-02', '2024-06-03', 'Ambil Ditempat', 'K002', 'K006', NULL, 44000, 'Diproses', 'Cash'),
('P015', 'TJS', '2024-06-05', '2024-06-08', 'Pesan Antar', 'K002', 'K006', 'K004', 26000, 'Diproses', 'Qris'),
('P003', 'JTM', '2024-06-12', NULL, 'Pesan Antar', 'K002', 'K003', 'K006', 30000, 'Diproses', 'Qris'),
('P006', 'SBS', '2024-06-12', NULL, 'Pesan Antar', 'K001', 'K003', 'K005', 50000, 'Diproses', 'Qris'),
('P008', 'DNY', '2024-06-12', NULL, 'Pesan Antar', 'K002', 'K003', 'K005', 56000, 'Diproses', 'Qris'),
('P014', 'NOT', '2024-06-12', NULL, 'Ambil Ditempat', 'K001', 'K004', NULL, 22800, 'Diproses', 'Qris'),
('P001', 'NOT', '2024-06-12', NULL, 'Ambil Ditempat', 'K001', 'K003', NULL, 15600, 'Diproses', 'Qris');

INSERT INTO detail_transaksi (id_transaksi, id_layanan, berat_per_kg, total)
VALUES
(1, 'CK002', 2, 12000),
(1, 'SP001', 2, 70000),
(2, 'CK002', 3, 18000),
(3, 'CS001', 3, 33000),
(4, 'CS002', 4, 24000),
(5, 'SL001', 2, 26000),
(6, 'SL002', 2, 30000),
(7, 'BK001', 3, 30000),
(8, 'SP001', 2, 70000),
(9, 'CK001', 3, 27000),
(10, 'CS001', 4, 44000),
(11, 'BK001', 3, 30000),
(12, 'CS001', 2, 22000),
(13, 'SL002', 3, 45000),
(14, 'CS001', 4, 44000),
(15, 'CK002', 3, 18000),
(16, 'CK002', 4, 24000),
(17, 'CS002', 5, 40000),
(18, 'BK001', 5, 50000),
(19, 'CK002', 3.8, 22800),
(20, 'CK002', 2.6, 15600);

-- Jumlah transaksi

SELECT tgl_masuk, COUNT(*) AS jumlah_transaksi
FROM transaksi
WHERE DATE_FORMAT(tgl_masuk, '%m-%d') = '05-24'
GROUP BY tgl_masuk;

-- Laporan harian

SELECT tgl_masuk, SUM(total_bayar) AS total_pendapatan
FROM transaksi
GROUP BY tgl_masuk
ORDER BY tgl_masuk;

-- Laporan bulanan

SELECT DATE_FORMAT(tgl_masuk, '%Y-%m') AS bulan, SUM(total_bayar) AS total_pendapatan
FROM transaksi
GROUP BY DATE_FORMAT(tgl_masuk, '%Y-%m') = '2024-05'
ORDER BY bulan;

-- Laporan Tahunan

SELECT DATE_FORMAT(tgl_masuk, '%Y') AS tahun, SUM(total_bayar) AS total_pendapatan
FROM transaksi
GROUP BY DATE_FORMAT(tgl_masuk, '%Y')
ORDER BY tahun;

-- Jumlah layanan yang dipakai pelanggan

SELECT 
    l.nama_layanan,
    COUNT(dt.id_layanan) AS jumlah_penggunaan
FROM 
    detail_transaksi dt
JOIN 
    layanan l ON dt.id_layanan = l.id_layanan
GROUP BY 
    dt.id_layanan
ORDER BY 
    jumlah_penggunaan DESC;

-- Tabel transaksi pada hari tertentu

SELECT 
    t.id_pelanggan, 
    t.tgl_masuk, 
    t.status, 
    l.nama_layanan,
    dt.berat_per_kg,
    dt.total AS biaya_layanan,
    t.total_bayar
FROM 
    transaksi t
JOIN 
    detail_transaksi dt ON t.id_transaksi = dt.id_transaksi
JOIN 
    layanan l ON dt.id_layanan = l.id_layanan
WHERE 
    t.tgl_masuk = '2024-05-24';

-- Data pesan antar pada hari tertentu (untuk kurir)

SELECT 
    t.id_pelanggan, 
    t.id_transaksi,
    t.tgl_masuk, 
    t.kode_ongkir, 
    o.nama_daerah,
    k.nama_karyawan AS nama_kurir
FROM 
    transaksi t
JOIN 
    ongkir o ON t.kode_ongkir = o.kode_ongkir
JOIN 
    karyawan k ON t.id_kurir = k.id_karyawan
WHERE
    t.tgl_masuk = '2024-05-24'
    AND
    t.kode_ongkir != 'NOT';

-- Menampilkan Data total Pengiriman yang sudah dilakukan masing masing kurir

SELECT 
    k.nama_karyawan AS nama_kurir,
    COUNT(t.id_transaksi) AS total_pengiriman
FROM 
    transaksi t
JOIN 
    karyawan k ON t.id_kurir = k.id_karyawan
WHERE 
    t.kode_ongkir != 'NOT'
GROUP BY 
    t.id_kurir,
    k.nama_karyawan;

-- Mencari pelanggan dengan nama

SELECT *
FROM pelanggan
WHERE nama_pelanggan LIKE 'A%';

-- Mencari transaksi berdasarkan attribute tertentu

SELECT * 
FROM transaksi
WHERE status = 'Siap Diambil';

-- Mencari data transaksi yang siap diantar

SELECT
    t.id_transaksi,
    t.tgl_masuk,
    t.id_pelanggan,
    p.nama_pelanggan,
    t.total_bayar,
    t.status
FROM
    transaksi t
JOIN
    pelanggan p ON t.id_pelanggan = p.id_pelanggan
WHERE
    t.status = 'Siap Antar';

-- Menampilkan data transaksi yang sudah selesai

SELECT 
    t.id_transaksi,
    t.tgl_masuk,
    t.tgl_keluar,
    t.total_bayar,
    k1.nama_karyawan AS kasir,
    k2.nama_karyawan AS operasional
FROM 
    transaksi t
JOIN 
    karyawan k1 ON t.id_kasir = k1.id_karyawan
JOIN 
    karyawan k2 ON t.id_operasional = k2.id_karyawan
WHERE 
    t.status = 'Selesai';

-- Mencari jumlah transaksi yang ditangani oleh karyawan tertentu

SELECT 
    k.id_karyawan, 
    k.nama_karyawan, 
    k.id_jabatan,
    COUNT(t.keterangan) AS jumlah_transaksi
FROM 
    karyawan k
LEFT JOIN 
    transaksi t ON k.id_karyawan IN (t.id_kasir, t.id_operasional, t.id_kurir)
GROUP BY 
    k.id_karyawan, k.nama_karyawan
ORDER BY 
    jumlah_transaksi DESC;

-- Mencari jumlah pelanggan dengan layanan pesan antar

SELECT
    keterangan,
    COUNT(id_pelanggan) AS jumlah_pelanggan
FROM
    transaksi
GROUP BY
    keterangan;

-- Layanan dari termurah ke termahal

SELECT *
FROM layanan
ORDER BY
    biaya_per_kg ASC;

-- Pelanggan dengan layanan terbanyak ke tersedikit

SELECT
    p.id_pelanggan, 
    p.nama_pelanggan,
    COUNT(t.id_pelanggan) AS Jumlah_Transaksi
FROM pelanggan p
JOIN transaksi t ON t.id_pelanggan = p.id_pelanggan
JOIN detail_transaksi d ON d.id_transaksi = t.id_transaksi
GROUP BY t.id_pelanggan
ORDER BY
    Jumlah_Transaksi DESC;

-- Pelanggan dengan transaksi terbanyak ke tersedikit

SELECT
    p.id_pelanggan, 
    p.nama_pelanggan,
    COUNT(t.id_pelanggan) AS Jumlah_Transaksi
FROM pelanggan p
JOIN transaksi t ON p.id_pelanggan = t.id_pelanggan
GROUP BY
    p.id_pelanggan, 
    p.nama_pelanggan
ORDER BY
    Jumlah_Transaksi DESC;

-- Transaksi berdasarkan waktu tertentu

SELECT *
FROM transaksi
WHERE DATE_FORMAT(tgl_masuk, '%Y-%m-%d') = '2024-05-01';

-- Jumlah Nominal Transaksi Per Pelanggan Terbesar ke Terkecil

SELECT
    p.nama_pelanggan,
    t.total_bayar
FROM transaksi t
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
ORDER BY t.total_bayar DESC;

-- Transaksi yang ditangani oleh karyawan tertentu 

SELECT
    t.id_transaksi,
    t.tgl_masuk,
    t.id_pelanggan,
    p.nama_pelanggan,
    t.id_kasir,
    k.nama_karyawan AS nama_kasir,
    t.total_bayar,
    t.status
FROM
    transaksi t
JOIN
    pelanggan p ON t.id_pelanggan = p.id_pelanggan
JOIN
    karyawan k ON t.id_kasir = k.id_karyawan
ORDER BY
    t.id_kasir,
    id_transaksi ASC;

-- Menampilkan data Total Pendapatan tiap layanan

SELECT
    l.nama_layanan,
    SUM(d.total) AS total_revenue
FROM
    detail_transaksi d
JOIN
    layanan l ON d.id_layanan = l.id_layanan
GROUP BY
    l.nama_layanan
ORDER BY
    total_revenue DESC;

-- Tampilan data yang ada di nota

SELECT 
    t.id_transaksi,
    p.nama_pelanggan,
    t.tgl_masuk,
    t.tgl_keluar,
    GROUP_CONCAT(l.nama_layanan SEPARATOR ', ') AS layanan_diambil,
    GROUP_CONCAT(dt.total SEPARATOR ', ') AS total_per_layanan,
    o.nama_daerah,
    o.biaya AS biaya_ongkir,
    k_kasir.nama_karyawan AS nama_kasir,
    k_operasional.nama_karyawan AS nama_operasional,
    k_kurir.nama_karyawan AS nama_kurir,
    t.total_bayar,
    t.metode_pembayaran
FROM 
    transaksi t
JOIN 
    pelanggan p ON t.id_pelanggan = p.id_pelanggan
JOIN 
    detail_transaksi dt ON t.id_transaksi = dt.id_transaksi
JOIN 
    layanan l ON dt.id_layanan = l.id_layanan
JOIN 
    ongkir o ON t.kode_ongkir = o.kode_ongkir
LEFT JOIN 
    karyawan k_kasir ON t.id_kasir = k_kasir.id_karyawan
LEFT JOIN 
    karyawan k_operasional ON t.id_operasional = k_operasional.id_karyawan
LEFT JOIN 
    karyawan k_kurir ON t.id_kurir = k_kurir.id_karyawan
WHERE 
    t.id_transaksi = 20
GROUP BY 
    t.id_transaksi, p.nama_pelanggan, t.tgl_masuk, t.tgl_keluar, o.nama_daerah, o.biaya, k_kasir.nama_karyawan, k_operasional.nama_karyawan, k_kurir.nama_karyawan, t.total_bayar, t.metode_pembayaran
ORDER BY 
    t.id_transaksi;

----------------------------------------------------------------------------------

UPDATE transaksi
SET tgl_keluar = NULL
WHERE status = 'Diproses';

ALTER TABLE detail_transaksi AUTO_INCREMENT = 0;

SELECT * FROM transaksi;
SELECT * FROM detail_transaksi;
SELECT * FROM layanan;
SELECT * FROM pelanggan;
SELECT * FROM karyawan;
SELECT * FROM ongkir;

DELETE FROM detail_transaksi;
DELETE FROM transaksi;
DELETE FROM karyawan;
DELETE FROM jabatan;
DELETE FROM pelanggan;
DELETE FROM ongkir;
DELETE FROM layanan;