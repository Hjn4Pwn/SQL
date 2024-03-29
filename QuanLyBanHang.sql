﻿ CREATE DATABASE QLBH
 USE QLBH

 CREATE TABLE KHACHHANG
 (
	 MAKH char(4) PRIMARY KEY,
	 HOTEN varchar(40),
	 DCHI varchar(50),
	 SODT varchar(20),
	 NGSINH smalldatetime,
	 DOANHSO money,
	 NGDK smalldatetime
 )
 CREATE TABLE NHANVIEN
 (
	 MANV char(4) PRIMARY KEY,
	 HOTEN varchar(40),
	 SODT varchar(20),
	 NGVL smalldatetime
 )
 CREATE TABLE SANPHAM
 (
	 MASP char(4) PRIMARY KEY,
	 TENSP varchar(40),
	 DVT varchar(20),
	 NUOCSX varchar(40),
	 GIA money
 )
 
 CREATE TABLE HOADON
 (
	 SOHD int PRIMARY KEY,
	 NGHD smalldatetime,
	 MAKH char(4) ,
	 MANV char(4),
	 TRIGIA money,
	 FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH),
	 FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
 )

 CREATE TABLE CTHD
 (
	 SOHD int ,
	 MASP char(4) ,
	 SL int,
	 CONSTRAINT PK_HD PRIMARY KEY(SOHD,MASP)
 )
ALTER TABLE SANPHAM ADD GHICHU varchar(20) 

ALTER TABLE KHACHHANG ADD LOAIKH varchar(20) 

ALTER TABLE SANPHAM ALTER COLUMN GHICHU varchar(100)

ALTER TABLE SANPHAM DROP COLUMN GHICHU

ALTER TABLE KHACHHANG  ALTER COLUMN LOAIKH VARCHAR(20)

ALTER TABLE SANPHAM ADD CONSTRAINT SP_DVT 
CHECK(DVT='cay' OR DVT='hop'OR DVT='cai'OR DVT='quyen'OR DVT='chuc') 

ALTER TABLE SANPHAM ADD CONSTRAINT SP_GIA CHECK(GIA>500)

ALTER TABLE KHACHHANG ADD CONSTRAINT KH_NGDK CHECK(NGDK > NGSINH)

SET DATEFORMAT DMY 

INSERT INTO KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO)
VALUES 
('KH02','TRAN NGOC HAN','23/5NGUYEN TRAI,Q5,TPHCM','0908256478','03/04/1974','30/07/2006',280000),
('KH03','TRAN NGOC LINH','45NGUYEN CANH CHAN,Q1,TPHCM','0938776266','10/06/1980','05/05/2006',3860000),
('KH04','TRAN MINH LONG','50/34LE DAI HANH,Q10,TPHCM','0917325476','09/03/1965','02/10/2006',250000),
('KH05','LE NHAT MINH','34TRUONG DINH,Q3,TPHCM','08246108','10/03/1950','28/10/2006',21000),
('KH06','LE HOAI THUONG','227NGUYEN VAN CU,Q5,TPHCM','08631738','31/12/1981','24/11/2006',915000),
('KH07','NGUYEN VAN TAM','32/3 TRAN BINH TRONG,Q5,TPHCM','0916783565','06/06/1971','01/12/2006',12500),
('KH08','PHAN THI THANH','45/2 AN DUONG VUONG,Q5,TPHCM','0938435756','10/01/1971','13/12/2006',365000),
('KH09','LE HA VINH','837 LE HONG PHONG,Q5,TPHCM','08654763','03/03/1979','14/01/2007',70000),
('KH10','HA DUY LAP','34/34B NGUYEN TRAI,Q5,TPHCM','08768904','02/05/1983','16/01/2007',67500),
('KH01','NGUYEN VAN A','731 TRAN HUNG DAO,Q5,THHCM','08823451','22/10/1960','22/07/2006',13060000)


INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) 
VALUES 
('NV01','NGUYEN NHU NHUT','0927345678','13/04/2006'),
('NV02','LE THI PHI YEN','0987567390','21/04/2006'),
('NV03','NGUYEN VAN B','0997047382','27/04/2006'),
('NV04','NGO THANH TUAN','0913758498','24/06/2006'),
('NV05','NGUYEN THI TRUC THANH','0918590387','20/07/2006')


INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) 
VALUES 
('BC01','BUT CHI','CAY','SINGAPORE',3000),
('BC02','BUT CHI','CAY','SINGAPORE',5000),
('BC03','BUT CHI','CAY','VIETNAM',3500),
('BC04','BUT CHI','HOP','VIETNAM',30000),
('BB01','BUT BI','CAY','VIETNAM',5000),
('BB02','BUT BI','CAY','TRUNGQUOC',7000),
('BB03','BUT BI','HOP','THAILAN',100000),
('TV01','TAP 100 TRANG GIAY MONG','QUYEN','TRUNGQUOC',2500),
('TV02','TAP 200 TRANG GIAY MONG','QUYEN','TRUNGQUOC',4500),
('TV03','TAP 100 TRANG GIAY TOT','QUYEN','VIETNAM',3000),
('TV04','TAP 200 TRANG GIAY TOT','QUYEN','VIETNAM',5500),
('TV05','TAP 100 TRANG ','CHUC','VIETNAM',23000),
('TV06','TAP 200 TRANG ','CHUC','VIETNAM',53000),
('TV07','TAP 100 TRANG ','CHUC','TRUNGQUOC',34000),
('ST01','SO TAY 500 TRANG','QUYEN','TRUNGQUOC',40000),
('ST02','SO TAY LOAI 1','QUYEN','VIETNAM',55000),
('ST03','SO TAY LOAI 2','QUYEN','VIETNAM',51000),
('ST04','SO TAY','QUYEN','THAILAN',55000),
('ST05','SO TAY MONG','QUYEN','THAILAN',20000),
('ST06','PHAN VIET BANG','HOP','VIETNAM',5000),
('ST07','PHAN KHONG BUI','HOP','VIETNAM',7000),
('ST08','BONG BAMG','CAI','VIETNAM',1000),
('ST09','BUT LONG','CAY','VIETNAM',5000),
('ST10','BUT LONG','CAY','TRUNGQUOC',7000)

INSERT INTO HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) 
VALUES 
(1001,'27/07/2006','KH01','NV01',320000),
 (1002,'10/08/2006','KH01','NV02',840000),
 (1003,'23/08/2006','KH02','NV01',100000),
 (1004,'01/09/2006','KH02','NV01',180000),
 (1005,'20/10/2006','KH01','NV02',3800000),
 (1006,'16/10/2006','KH01','NV03',2430000),
 (1007,'28/10/2006','KH03','NV03',510000),
 (1008,'28/10/2006','KH01','NV03',440000),
 (1009,'28/10/2006','KH03','NV04',200000),
 (1010,'01/11/2006','KH01','NV01',5200000),
 (1011,'04/11/2006','KH04','NV03',250000),
 (1012,'30/11/2006','KH05','NV03',21000),
 (1013,'12/12/2006','KH06','NV01',5000),
 (1014,'31/12/2006','KH03','NV02',3150000),
 (1015,'01/01/2007','KH06','NV01',910000),
 (1016,'01/01/2007','KH07','NV02',12500),
 (1017,'02/01/2007','KH08','NV03',35000),
 (1018,'13/01/2007','KH08','NV03',330000),
 (1019,'13/01/2007','KH01','NV03',30000),
 (1020,'14/01/2007','KH09','NV04',70000),
 (1021,'16/01/2007','KH10','NV03',67500),
 (1022,'16/01/2007',NULL,'NV03',7000),
 (1023,'17/01/2007',NULL,'NV01',330000)


 INSERT INTO CTHD(SOHD,MASP,SL) 
 VALUES 
 (1001,'TV02',10),
 (1001,'ST01',5),
 (1001,'BC01',5),
 (1001,'BC02',10),
 (1001,'ST08',10),
 (1002,'BC04',20),
 (1002,'BB01',20),
 (1002,'BB02',20),
 (1003,'BB03',10),
 (1004,'TV01',20),
 (1004,'TV02',10),
 (1004,'TV03',10),
 (1004,'TV04',10),
 (1005,'TV05',50),
 (1005,'TV06',50),
 (1006,'TV07',20),
 (1006,'ST01',30),
 (1006,'ST02',10),
 (1007,'ST03',10),
 (1008,'ST04',8),
 (1009,'ST05',10),
 (1010,'TV07',50),
 (1010,'ST07',50),
 (1010,'ST08',100),
 (1010,'ST04',50),
 (1010,'TV03',100),
 (1011,'ST06',50),
 (1012,'ST07',3),
 (1013,'ST08',5),
 (1014,'BC02',80),
 (1014,'BB02',100),
 (1014,'BC04',60),
 (1014,'BB01',50),
 (1015,'BB02',30),
 (1015,'BB03',7),
 (1016,'TV01',5),
 (1017,'TV02',1),
 (1017,'TV03',1),
 (1017,'TV04',5),
 (1018,'ST04',6),
 (1019,'ST05',1),
 (1019,'ST06',2),
 (1020,'ST07',10),
 (1021,'ST08',5),
 (1021,'TV01',7),
 (1021,'TV02',10),
 (1022,'ST07',1),
 (1023,'ST04',6)


SELECT * INTO SANPHAM1
FROM SANPHAM;

SELECT * INTO KHACHHANG1
FROM KHACHHANG;

UPDATE SANPHAM1 SET GIA=GIA*105/100 WHERE NUOCSX='THAILAN'

UPDATE SANPHAM1 SET GIA=GIA*95/100 WHERE NUOCSX='TRUNGQUOC' AND GIA <10000 

UPDATE KHACHHANG1 SET LOAIKH='VIP' WHERE (NGDK<'01/01/2007'AND DOANHSO >10000000  )
OR  (NGDK>='01/01/2007'AND DOANHSO >2000000  )

SELECT MASP,TENSP FROM SANPHAM WHERE NUOCSX='TRUNGQUOC'

SELECT MASP,TENSP FROM SANPHAM WHERE DVT IN ('CAY' , 'QUYEN')

SELECT MASP,TENSP FROM SANPHAM WHERE MASP LIKE 'B%01'

SELECT MASP,TENSP FROM SANPHAM WHERE NUOCSX='TRUNGQUOC' AND (GIA BETWEEN 30000 AND 40000)
 
SELECT MASP,TENSP FROM SANPHAM WHERE  NUOCSX IN ('TRUNGQUOC', 'THAILAN') AND (GIA BETWEEN 30000 AND 40000)

SELECT SOHD, TRIGIA FROM HOADON WHERE NGHD = '1/1/2007'  OR NGHD = '2/1/2007'

SELECT SOHD, TRIGIA FROM HOADON WHERE YEAR (NGHD)=2007 AND MONTH (NGHD)=1 ORDER BY NGHD, TRIGIA DESC

SELECT KHACHHANG.MAKH, KHACHHANG.HOTEN FROM KHACHHANG,HOADON WHERE KHACHHANG.MAKH=HOADON.MAKH AND HOADON.NGHD ='1/1/2007'

SELECT HOADON.SOHD,HOADON.TRIGIA FROM HOADON,NHANVIEN WHERE NHANVIEN.MANV=HOADON.MANV AND HOADON.NGHD='28/10/2006' AND NHANVIEN.HOTEN='NGUYEN VAN B'

SELECT SANPHAM.MASP, TENSP FROM SANPHAM, KHACHHANG, HOADON,CTHD WHERE CTHD.MASP=SANPHAM.MASP AND HOADON.SOHD=CTHD.SOHD AND KHACHHANG.MAKH=HOADON.MAKH AND HOTEN='NGUYEN VAN A' AND MONTH(NGHD)=10 AND YEAR(NGHD)=2006

SELECT SOHD FROM CTHD WHERE MASP IN ('BB01', 'BB02')

--III.12
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02')
AND SL BETWEEN 10 AND 20

--III.13
SELECT A.SOHD
FROM CTHD A,CTHD B
WHERE A.MASP = 'BB01'
AND B.MASP= 'BB02'
AND A.SL BETWEEN 10 AND 20
AND B.SL BETWEEN 10 AND 20

--III.14
SELECT MASP,TENSP
FROM SANPHAM
WHERE NUOCSX='TRUNGQUOC'
UNION 
SELECT SANPHAM.MASP,TENSP
FROM SANPHAM, HOADON,CTHD
WHERE CTHD.MASP= SANPHAM.MASP
	AND CTHD.SOHD=HOADON.SOHD
	AND NGHD='1/1/2007'

--III.15
SELECT MASP,TENSP
FROM SANPHAM
EXCEPT 
 SELECT SANPHAM.MASP,TENSP
 FROM SANPHAM,CTHD,HOADON
 WHERE CTHD.MASP= SANPHAM.MASP
	AND CTHD.SOHD=HOADON.SOHD

--III.16
SELECT MASP,TENSP
FROM SANPHAM
EXCEPT 
 SELECT SANPHAM.MASP,TENSP
 FROM SANPHAM,CTHD,HOADON
 WHERE CTHD.MASP= SANPHAM.MASP
	AND CTHD.SOHD=HOADON.SOHD AND YEAR(NGHD) = 2006

--III.17
SELECT MASP,TENSP
FROM SANPHAM
WHERE NUOCSX='TRUNGQUOC'
EXCEPT 
 SELECT SANPHAM.MASP,TENSP
 FROM SANPHAM,CTHD,HOADON
 WHERE CTHD.MASP= SANPHAM.MASP
	AND CTHD.SOHD=HOADON.SOHD AND YEAR(NGHD) = 2006 AND NUOCSX='TRUNGQUOC'


--III.18
SELECT SOHD
FROM HOADON
WHERE NOT EXISTS 
			( SELECT *
			FROM SANPHAM
			WHERE NUOCSX='SINGAPORE'
				AND NOT EXISTS	
						(SELECT *
						FROM CTHD
						WHERE CTHD.MASP=SANPHAM.MASP
							AND CTHD.SOHD=HOADON.SOHD))
--III.19
SELECT SOHD
FROM HOADON
WHERE  NOT EXISTS 
			( SELECT *
			FROM SANPHAM
			WHERE NUOCSX='SINGAPORE' 
				AND NOT EXISTS	
						(SELECT *
						FROM CTHD
						WHERE CTHD.MASP=SANPHAM.MASP
							AND CTHD.SOHD=HOADON.SOHD
							AND YEAR(NGHD)=2006))


--III.20

SELECT COUNT (*)
FROM HOADON H
WHERE H.MAKH NOT IN ( SELECT K.MAKH FROM  KHACHHANG K WHERE H.MAKH=K.MAKH)

--III.21
SELECT COUNT (DISTINCT SP.MASP)
FROM SANPHAM SP,HOADON H,CTHD C
WHERE SP.MASP=C.MASP AND H.SOHD=C.SOHD
		AND YEAR(H.NGHD)=2006

--III.22
SELECT MIN(TRIGIA) MIN_TRI_GIA, MAX(TRIGIA) MAX_TRI_GIA
FROM HOADON

--III.23
SELECT AVG(TRIGIA) TRI_GIA_TB_2006
FROM HOADON
WHERE YEAR(NGHD)=2006

--III.24
SELECT SUM(TRIGIA) DOANHTHU_2006
FROM HOADON
WHERE YEAR(NGHD)=2006

--III.25
SELECT H1.SOHD
FROM HOADON H1
WHERE YEAR(NGHD)=2006 AND H1.TRIGIA=( SELECT MAX(H2.TRIGIA) 
									FROM HOADON H2 
									WHERE YEAR(NGHD)=2006)

--III.26
SELECT HOTEN 
FROM HOADON H,KHACHHANG
WHERE KHACHHANG.MAKH=H.MAKH AND H.SOHD=(SELECT H1.SOHD
			FROM HOADON H1
			WHERE YEAR(NGHD)=2006 AND H1.TRIGIA=( SELECT MAX(H2.TRIGIA) 
													FROM HOADON H2 
													WHERE YEAR(NGHD)=2006))

--III.27
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY(DOANHSO) DESC

--III.28
SELECT SP1.MASP,SP1.TENSP
FROM SANPHAM SP1
WHERE SP1.GIA IN (SELECT DISTINCT TOP 3 SP2.GIA 
				FROM SANPHAM SP2
				ORDER BY (SP2.GIA) DESC) 

--III.29
SELECT SP1.MASP,SP1.TENSP
FROM SANPHAM SP1
WHERE SP1.NUOCSX='THAILAN' AND SP1.GIA IN (SELECT DISTINCT TOP 3 SP2.GIA 
				FROM SANPHAM SP2
				ORDER BY (SP2.GIA) DESC) 

--III.30
SELECT SP1.MASP,SP1.TENSP
FROM SANPHAM SP1
WHERE SP1.NUOCSX='TRUNGQUOC' AND SP1.GIA IN (SELECT DISTINCT TOP 3 SP2.GIA 
				FROM SANPHAM SP2
				WHERE SP2.NUOCSX='TRUNGQUOC'
				ORDER BY (SP2.GIA) DESC) 

--III.31
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC

--III.32
SELECT COUNT(DISTINCT MASP)
FROM SANPHAM
WHERE NUOCSX='TRUNGQUOC'

--III.33
SELECT NUOCSX,COUNT(DISTINCT MASP) SOLUONG_SP
FROM SANPHAM
GROUP BY NUOCSX

--III.34
SELECT NUOCSX,COUNT(DISTINCT MASP) SOLUONG_SP,MAX(GIA) GIA_CAONHAT, MIN(GIA) GIA_THAPNHAT,AVG(GIA) GIA_TB
FROM SANPHAM
GROUP BY NUOCSX

--III.35
SELECT NGHD,SUM(TRIGIA) DOANHTHU
FROM HOADON
GROUP BY NGHD

--III.36
SELECT MASP,SUM(SL)
FROM CTHD,HOADON
WHERE CTHD.SOHD=HOADON.SOHD AND MONTH(NGHD) = 10 AND YEAR(NGHD)=2006
GROUP BY MASP

--III.37
SELECT MONTH(NGHD) THANG,SUM(TRIGIA) DOANHTHU
FROM HOADON
WHERE YEAR(NGHD)=2006 
GROUP BY MONTH(NGHD)

--III.38
SELECT H1.SOHD
FROM HOADON H1
WHERE 4<= (
			SELECT COUNT(DISTINCT MASP)
			FROM HOADON H2,CTHD
			WHERE H2.SOHD=CTHD.SOHD AND H1.SOHD=H2.SOHD
			GROUP BY CTHD.SOHD
		   )
--III.39
SELECT H1.SOHD
FROM HOADON H1
WHERE 3 <= (
			SELECT COUNT(DISTINCT CTHD.MASP)
			FROM HOADON H2,CTHD,SANPHAM SP
			WHERE H2.SOHD=CTHD.SOHD 
			AND H1.SOHD=H2.SOHD 
			AND SP.MASP=CTHD.MASP 
			AND NUOCSX='VIETNAM'
			GROUP BY CTHD.SOHD
		   )

--III.40
SELECT MAKH, HOTEN
FROM KHACHHANG
WHERE MAKH = (SELECT TOP 1 MAKH
			FROM HOADON
			GROUP BY MAKH
			ORDER BY COUNT(DISTINCT SOHD) DESC)

--III.41
SELECT TOP 1 MONTH(NGHD) THANG,SUM(TRIGIA) DOANHTHU
FROM HOADON
WHERE YEAR(NGHD)=2006 
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC

--III.42
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP = (SELECT TOP 1 MASP
			FROM CTHD,HOADON 
			WHERE CTHD.SOHD=HOADON.SOHD AND YEAR(NGHD)=2006 
			GROUP BY MASP
			ORDER BY SUM(SL) )

--III.43
SELECT S.NUOCSX , MASP, TENSP
FROM SANPHAM S , ( SELECT NUOCSX, MAX(GIA) AS MAX_GIA
				FROM SANPHAM
				GROUP BY NUOCSX) AS A

WHERE  S.NUOCSX=A.NUOCSX AND GIA=MAX_GIA



--III.44
SELECT DISTINCT SP1.NUOCSX
FROM SANPHAM SP1
WHERE 3 <= (
			SELECT COUNT(DISTINCT GIA)
			FROM SANPHAM SP2
			WHERE SP1.NUOCSX=SP2.NUOCSX
			GROUP BY SP2.NUOCSX )

--III.45
SELECT TOP 1 H.MAKH
FROM HOADON H
WHERE H.MAKH IN (SELECT TOP 10 MAKH
				FROM KHACHHANG
				ORDER BY DOANHSO DESC)
GROUP BY H.MAKH
ORDER BY COUNT(DISTINCT H.SOHD) DESC


--I.11
-- Trigger: thêm và sửa NgHD của HoaDon
GO
CREATE TRIGGER IU_NGHD ON HOADON
FOR INSERT,UPDATE
AS
BEGIN
	IF ( (SELECT COUNT(*) FROM KHACHHANG,INSERTED
		WHERE KHACHHANG.MAKH=INSERTED.MAKH
		AND KHACHHANG.NGDK > INSERTED.NGHD ) > 0)
	BEGIN
		PRINT'ERROR: NGHD PHAI >= NGDK'
		ROLLBACK TRANSACTION 
	END
END

-- Trigger: sửa NgDK của KhachHang
GO
CREATE TRIGGER UPD_NGDK ON KHACHHANG			
FOR Update
AS
BEGIN
	IF ((SELECT COUNT(*) FROM HOADON, inserted
				WHERE HOADON.MAKH = inserted.MAKH
				AND HOADON.NGHD < inserted.NGDK) > 0)
	BEGIN
		PRINT 'Error: NgHD phai >= NgDK'
		ROLLBACK TRANSACTION
	END
END

--I.12
-- Trigger: thêm và sửa NgHD của HoaDon
GO
CREATE TRIGGER IU_NGBH ON HOADON
FOR Insert, Update
AS
BEGIN
	IF (EXISTS (SELECT * FROM NHANVIEN, inserted 
				WHERE NHANVIEN.MANV = inserted.MAKH 
				AND NHANVIEN.NGVL > inserted.NGHD))
	BEGIN
		PRINT 'ERROR: NGHD phai >= NGVL'
		ROLLBACK TRANSACTION
	END
END

-- Trigger: sửa NGVL của NhanVien
GO
CREATE TRIGGER UPD_NGVL ON NHANVIEN
FOR Update
AS
BEGIN
	IF (EXISTS (SELECT * FROM HOADON, inserted
				WHERE HOADON.MaNV = inserted.MANV
				AND HOADON.NGHD < inserted.NGVL))
	BEGIN
		PRINT 'ERROR: NGHD phai >= NGDK'
		ROLLBACK TRANSACTION
	END
END


--I.14
GO
CREATE TRIGGER INSERT_HD ON HOADON
FOR INSERT
AS
BEGIN
	IF ( EXISTS(SELECT * FROM inserted WHERE TRIGIA != 0))
	BEGIN 
		PRINT 'ERROR'
	END
	ELSE
	BEGIN
		PRINT 'SUCCESSFUL'
	END
END


GO
CREATE TRIGGER INSERT_CTHD ON CTHD
FOR INSERT
AS
BEGIN
	UPDATE HOADON
	SET TRIGIA=   TRIGIA+ (SELECT SUM(SL * GIA) FROM INSERTED I ,SANPHAM 
	WHERE I.MASP=SANPHAM.MASP AND I.SOHD=HOADON.SOHD )
					
END