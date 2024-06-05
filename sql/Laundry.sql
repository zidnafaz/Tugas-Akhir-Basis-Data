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
    metode_pembayaran ENUM ('Qris', 'Cash') NOT NULL,
    status ENUM ('Diproses', 'Siap Antar', 'Siap Diambil', 'Selesai') DEFAULT 'Diproses',
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
('KA001', 'Indah', '08545354869', 'Perempuan', 'KA'),
('KA002', 'Nabil', '08545359645', 'Laki-laki', 'KA'),
('KR001', 'Irul', '08545354169', 'Laki-laki', 'KR'),
('KR002', 'Dewi', '08545355429', 'Perempuan', 'KR'),
('OP001', 'Agus', '08545357610', 'Laki-laki', 'OP'),
('OP002', 'Sulis', '08545357603', 'Perempuan', 'OP');

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
('P001', 'AJS', '2024-05-01', '2024-05-05', 'Pesan Antar', 'KA001', 'OP001', 'KR001', 95000, 'Diproses', 'Cash'),
('P002', 'BJS', '2024-05-03', '2024-05-06', 'Pesan Antar', 'KA002', 'OP002', 'KR002', 31000, 'Siap Antar', 'Qris'),
('P003', 'NOT', '2024-05-04', '2024-05-05', 'Ambil Ditempat', 'KA001', 'OP001', NULL, 27000, 'Siap Diambil', 'Cash'),
('P004', 'BNR', '2024-05-05', '2024-05-08', 'Pesan Antar', 'KA001', 'OP001', 'KR001', 45000, 'Selesai', 'Cash'),
('P005', 'NOT', '2024-05-06', '2024-05-09', 'Ambil Ditempat', 'KA002', 'OP002', NULL, 26000, 'Siap Ambil', 'Qris'),
('P006', 'KST', '2024-05-07', '2024-05-11', 'Pesan Antar', 'KA001', 'OP001', 'KR001', 43000, 'Selesai', 'Cash'),
('P007', 'PDW', '2024-05-08', '2024-05-11', 'Pesan Antar', 'KA002', 'OP002', 'KR002', 43000, 'Diproses', 'Qris'),
('P008', 'NOT', '2024-05-09', '2024-05-13', 'Ambil Ditempat', 'KA002', 'OP002', NULL, 70000, 'Siap Ambil', 'Cash'),
('P009', 'NOT', '2024-05-10', '2024-05-11', 'Ambil Ditempat', 'KA001', 'OP001', NULL, 27000, 'Diproses', 'Qris'),
('P010', 'PWT', '2024-05-11', '2024-05-12', 'Pesan Antar', 'KA001', 'OP001', 'KR001', 54000, 'Siap Antar', 'Cash'),
('P011', 'TGW', '2024-05-19', '2024-05-22', 'Pesan Antar', 'KA001', 'OP001', 'KR001', 36000, 'Cash', 'Diproses'),
('P012', 'DNY', '2024-05-24', '2024-05-25', 'Pesan Antar', 'KA002', 'OP002', 'KR002', 28000, 'Qris', 'Siap Antar'),
('P013', 'KTW', '2024-05-24', '2024-05-28', 'Pesan Antar', 'KA001', 'OP001', 'KR001', 51000, 'Qris', 'Diproses'),
('P014', 'NOT', '2024-06-02', '2024-06-03', 'Ambil Ditempat', 'KA002', 'OP002', NULL, 44000, 'Cash', 'Diproses'),
('P015', 'TJS', '2024-06-05', '2024-06-08', 'Pesan Antar', 'KA002', 'OP002', 'KR002', 26000, 'Qris', 'Diproses');

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
(15, 'CK002', 3, 18000);

-- Jumlah transaksi

SELECT tgl_masuk, COUNT(*) AS jumlah_transaksi
FROM transaksi
WHERE DATE_FORMAT(tgl_masuk, '%m-%d') = '05-05'
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
    dt.id_layanan, l.nama_layanan
ORDER BY 
    jumlah_penggunaan DESC;

UPDATE transaksi
SET status = 'Siap Antar'
WHERE id_transaksi = 10;

SELECT * FROM transaksi;
SELECT * FROM detail_transaksi;
SELECT * FROM layanan;
SELECT * FROM pelanggan;
SELECT * FROM karyawan;
SELECT * FROM ongkir;