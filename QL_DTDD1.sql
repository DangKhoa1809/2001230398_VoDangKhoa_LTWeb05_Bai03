CREATE DATABASE QL_DTDD1;
USE QL_DTDD1;

-- TẠO BẢNG KHÁCH HÀNG --
CREATE TABLE KHACHHANG (
    MAKH INT PRIMARY KEY IDENTITY(1,1),
    HOTEN NVARCHAR(100) NOT NULL,
    DIENTHOAI VARCHAR(15),
    GIOITINH NVARCHAR(10),
    SOTHICH NVARCHAR(100),
    EMAIL VARCHAR(100) UNIQUE,
    MATKHAU NVARCHAR(50)
);

-- TẠO BẢNG LOẠI --
CREATE TABLE LOAI (
    MALOAI INT PRIMARY KEY IDENTITY(1,1),
    TENLOAI NVARCHAR(100) NOT NULL
);

-- TẠO BẢNG SẢN PHẨM --
CREATE TABLE SANPHAM (
    MASP INT PRIMARY KEY IDENTITY(1,1),
    TENSP NVARCHAR(100) NOT NULL,
    DUONGDAN NVARCHAR(200),
    GIA DECIMAL(18,2) NOT NULL,
    MOTA NVARCHAR(500),
    MALOAI INT NOT NULL,
    CONSTRAINT FK_SP_L FOREIGN KEY (MALOAI) REFERENCES LOAI(MALOAI)
);

-- TẠO BẢNG GIỎ HÀNG --
CREATE TABLE GIOHANG (
    MAGH INT PRIMARY KEY IDENTITY(1,1),
    MAKH INT NOT NULL,
    MASP INT NOT NULL,
    SOLUONG INT NOT NULL,
    NGAY DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_GH_KH FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
    CONSTRAINT FK_GH_SP FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);

-- NHẬP LIỆU BẢNG LOẠI --
INSERT INTO LOAI (TENLOAI) VALUES 
(N'Nokia'),
(N'SamSung'),
(N'Motorola'),
(N'LG'),
(N'Oppo'),
(N'Iphone'),
(N'BPhone');

SELECT*FROM LOAI;

-- NHẬP LIỆU BẢNG SẢN PHẨM --
INSERT INTO SANPHAM (TENSP, DUONGDAN, GIA, MOTA, MALOAI) VALUES
('N701', 'N70.jpg', 2000000, N'Nâng cấp BN', 1),
('N72', 'N72.jpg', 2100000, N'Nâng cấp BN, 2 màu Đen, Xám', 1),
('N6030', 'N6030.jpg', 3000000, N'Nâng cấp BN, Gấp', 1),
('N6200', 'N6200.jpg', 3200000, N'Nâng cấp BN, Màu Đen, Xám, Đỏ, Bạc', 1),
('GalaxyA6', 'GalaxyA6.jpg', 5200000, N'Nâng cấp BN, Màu Đen, Xám, Đỏ, Bạc', 2),
('GalaxyA9', 'GalaxyA9.jpg', 5500000, N'Nâng cấp BN, Màu Đen, Xám, Đỏ, Bạc', 2),
('GalaxyJ5', 'GalaxyJ5.jpg', 6000000, N'Nâng cấp BN, Màu Đen, Xám, Đỏ, Bạc', 2),
('MotoE5', 'MotoE5.jpg', 2300000, N'Unlimited Extra', 3),
('MotoG7', 'MotoG7.jpg', 8000000, N'Unlimited Extra', 3),
('MotoP30', 'MotoP30.jpg', 7900000, N'Unlimited Extra', 3),
('Iphone4S', 'Iphone4S.jpg', 3000000, N'Không nâng cấp', 6),
('Iphone5S', 'Iphone5S.jpg', 5000000, N'Không nâng cấp', 6),
('Iphone6p', 'Iphone6p.jpg', 10000000, N'Không nâng cấp', 6),
('Iphone7', 'Iphone7.jpg', 15000000, N'Không nâng cấp', 6),
('Iphone8p', 'Iphone8p.jpg', 20000000, N'Không nâng cấp', 6);

SELECT*FROM SANPHAM;

-- NHẬP LIỆU BẢNG KHÁCH HÀNG --
INSERT INTO KHACHHANG(HOTEN, DIENTHOAI, GIOITINH, SOTHICH, EMAIL, MATKHAU) VALUES
(N'Nguyễn Văn Trí', '0912345678', N'Nam', N'Trò chơi, Công nghệ', 'vantri@gmail.com', '123456'),
(N'Trần Thị Mơ', '0987654321', N'Nữ', N'Mua sắm, Du lịch', 'thimo@gmail.com', 'abcdef'),
(N'Lê Văn Thức', '0909090909', N'Nam', N'Xem phim, Đọc sách', 'vanthuc@gmail.com', 'pass123'),
(N'Phạm Thị Xuân', '0933111222', N'Nữ', N'Âm nhạc, Thời trang', 'thixuan@gmail.com', 'dpass789'),
(N'Hoàng Văn Khoa', '0977555444', N'Nam', N'Thể thao, Du lịch', 'vankhoa@gmail.com', 'epass456');

SELECT*FROM KHACHHANG;

-- NHẬP LIỆU BẢNG GIỎ HÀNG --
INSERT INTO GIOHANG (MAKH, MASP, SOLUONG, NGAY) VALUES
(1, 5, 1, '2023-09-01'), -- Nguyễn Văn Trí mua GalaxyA6
(1, 14, 2, '2023-09-02'), -- Nguyễn Văn Trí mua 2 Iphone7
(2, 13, 1, '2023-09-05'), -- Trần Thị Mơ mua Iphone6p
(3, 6, 1, '2023-09-07'), -- Lê Văn Thức mua GalaxyA9
(4, 10, 1, '2023-09-10'); -- Phạm Thị Xuân mua MotoP30

SELECT*FROM GIOHANG;