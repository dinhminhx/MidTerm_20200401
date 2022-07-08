--#Mid-Term: Thuc tap CSDL
--#Class ID: 130989
--#Student ID: 20200401
--#Student Name:Nghiêm Đình Minh
--#Source File: NghiemDinhMinh_20200401_Midterm.sql
-- drop database QL;
CREATE DATABASE QL;
CREATE TABLE GiangVien
(
	GV varchar(10) Primary key,
	HoTen Nvarchar(30),
	NamSinh int,
	DiaChi Nvarchar(50)
);
CREATE TABLE DeTai
(
	DT varchar(10) Primary key,
	TenDT Nvarchar(50),
	TheLoai Nvarchar(20)
);

CREATE TABLE SinhVien
(
	SV varchar(10) Primary key,
	TenSV Nvarchar(30),
	NgaySinh date,
	QueQuan Nvarchar(20),
	Lop Nvarchar(20)
);


CREATE TABLE HuongDan
(
	GV varchar(10) FOREIGN KEY REFERENCES GiangVien(GV) on delete cascade,
	DT varchar(10) FOREIGN KEY REFERENCES DeTai(DT) on delete cascade,
	SV varchar(10) FOREIGN KEY REFERENCES SinhVien(SV) on delete cascade,
	NamThucHien int,
	KetQua float(2),
	Primary key(DT,SV,NamThucHien)
);

insert into GiangVien
values 
('GV001',N'Mai Văn Tường','1990',N'Nam Định'),
('GV002',N'Nghiêm Đình Minh','1988',N'Hà Nội'),
('GV003',N'Nguyễn Thành Đạt','1991',N'Thái Bình'),
('GV004',N'Trần Hồng Việt','1980',N'Hà Nội'),
('GV005',N'Hào Quang','1992',N'Thanh Hóa'),
('GV006',N'Trình Lê','1993',N'Thanh Hóa'),
('GV007',N'Nguyễn Thi','1983',N'Hà Nam'),
('GV008',N'Diệu Linh','1989',N'Hà Nội'),
('GV009',N'Đinh Văn Hùng','1988',N'Phú Thọ'),
('GV010',N'Lê Thị Nguyệt','1988',N'Phú Thọ'),
('GV011',N'Đỗ Quang Huy','1988',N'Phú Thọ'),
('GV012',N'Nguyễn Thị Thu','1990',N'Hải Phòng');

-- delete from Detai;

insert into DeTai
values ('DT01',N'Quản lý bán hàng',N'Ứng Dụng'),
('DT02',N'Quản lý nhà hàng',N'Thực Phẩm'),
('DT03',N'Sản xuất bom',N'Quân Sự'),
('DT04',N'Bán kẹo kéo',N'Thực Phẩm'),
('DT05',N'Bán máy tính',N'Bán Hàng'),
('DT06',N'Bán Sách',N'Bán Hàng'),
('DT07',N'Bán hàng thập cẩm',N'Thực Phẩm'),
('DT08',N'Bán bánh trung thu',N'Thực Phẩm'),
('DT09',N'Bán rau',N'Thực Phẩm'),
('DT10',N'Nghiên cứu bom hạt nhân',N'Quân Sự');

insert into SinhVien
values ('SV001',N'Bùi','2000-01-01',N'Nam Định','VN03'),
('SV002',N'Thu','2000-05-05',N'Nam Định','VN03'),
('SV003',N'Hà','2000-01-19',N'Nam Định','VN01'),
('SV004',N'Nguyễn','2000-04-23',N'Nam Định','VN01'),
('SV005',N'Nguyễn Xuân Dũng','2000-01-28',N'Hà Nam','VN02'),
('SV006',N'Nguyễn Văn Nam','2000-10-12',N'Bắc Giang','VN03'),
('SV007',N'Hoàng','2000-10-12',N'Bắc Giang','VN02'),
('SV008',N'Quang','2000-10-12',N'Bắc Ninh','VN02'),
('SV009',N'Đạt','2000-10-12',N'Quảng Ninh','VN03'),
('SV010',N'Văn','2000-10-12',N'Hải Phòng','VN03'),
('SV011',N'Nam','2000-10-12',N'Hà Nam','VN01'),
('SV012',N'Vũ','2000-10-12',N'Ninh Bình','VN03'),
('SV013',N'Hiếu','2000-10-12',N'Lào Cai','VN01'),
('SV014',N'Tùng','2000-10-12',N'Lạng Sơn','VN01'),
('SV015',N'Duy','2000-10-12',N'Bắc Giang','VN03');

insert into HuongDan
values('GV001','DT02','SV003','2022','8'),
('GV002','DT03','SV002','2020','9'),
('GV003','DT01','SV005','2019','6'),
('GV002','DT04','SV001','2022','7'),
('GV003','DT09','SV007','2022','1'),
('GV004','DT10','SV009','2018','3'),
('GV006','DT05','SV010','2019','6'),
('GV009','DT03','SV013','2022','4'),
('GV007','DT08','SV007','2021','2'),
('GV004','DT07','SV009','2020','8'),
('GV012','DT06','SV002','2021','1'),
('GV010','DT04','SV001','2019','5'),
('GV011','DT02','SV004','2022','3'),
('GV012','DT02','SV011','2022','0'),
('GV005','DT01','SV006','2018','7');
------------------
SELECT * from GiangVien
WHERE GiangVien.GV = 'GV001';
-----------------
SELECT count(*) as SoDeTai from DeTai
WHERE DeTai.TheLoai = N'Ứng Dụng';
---------------
SELECT count(*) as SoLuongSV from SinhVien 
join HuongDan on SinhVien.SV = HuongDan.SV
WHERE HuongDan.GV = 'GV102' AND SinhVien.QueQuan = N'Hải Phòng';
--------------------
SELECT TenDT from DeTai
EXCEPT 
(
SELECT TenDT from DeTai
WHERE DT in ( SELECT DT from HuongDan )
);
-------------------
UPDATE SinhVien
SET NgaySinh = '1991-11-12'
WHERE TenSV = N'Nguyễn Văn Nam' AND QueQuan = N'Bắc Giang';
---------------------
delete from SinhVien where TenSV = N'Nguyễn Văn Nam' and QueQuan = N'Bắc Giang';

--------------
create view DeTaiHuongDan as
select GiangVien.HoTen as GiangVien, SinhVien.TenSV as SinhVien, DeTai.TenDT as DeTai, HuongDan.NamThucHien
from HuongDan
join GiangVien on GiangVien.GV = HuongDan.GV
join SinhVien on SinhVien.SV = HuongDan.SV
join DeTai on DeTai.DT = HuongDan.DT;
------------------
--------------
select DeTaiHuongDan.DeTai from DeTaiHuongDan
where NamThucHien = 2022
group by DeTaiHuongDan.DeTai;
---------------
CREATE LOGIN ThuyNV WITH PASSWORD = 'thuy123';
CREATE USER ThuyNV for login ThuyNV;
Grant Select on dbo.GiangVien to ThuyNV;
grant SELECT on dbo.HuongDan to ThuyNV;

CREATE LOGIN QuanTL WITH PASSWORD = 'quan123';
CREATE USER QuanTL for login QuanTL;
grant create table, create view to QuanTL;

CREATE ROLE GiamDoc;
CREATE LOGIN TienND WITH PASSWORD = 'tien123';
CREATE LOGIN CuongPV WITH PASSWORD = 'cuong123';
Create User TienND;
Create User CuongPV;
ALTER ROLE GiamDoc
ADD MEMBER TienND;
ALTER ROLE GiamDoc
ADD MEMBER CuongPV;
grant DELETE, INSERT, REFERENCES, SELECT, UPDATE to GiamDoc;

