CREATE DATABASE [NVUTT]
CREATE TABLE [dbo].[admin](
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL
)
create table phongban(
maphong nvarchar(50) primary key constraint idpb default dbo.auto_idpb(),
tenphong nvarchar(50),
chucnang nvarchar(50),
)

 
CREATE TABLE [dbo].[nhanvien](
	[manhanvien] [nvarchar](50) primary key constraint idnv default dbo.auto_id(),
	[tennhanvien] [nvarchar](50) NULL,
	[maphong] [nvarchar](50) NULL,
	[machucvu] [nvarchar](50) NULL,
	[mangoaingu] [nvarchar](50) NULL,
	[mahocvan] [nvarchar](50) NULL,
	[mahopdong] [nvarchar](50) NULL
)
CREATE TABLE [dbo].[hopdong](
	[mahopdong] [nvarchar](50)  primary key constraint idhd default dbo.auto_idhd(),
	[manhanvien] [nvarchar](50),
	[ngaybatdau] [nvarchar](50) NULL,
	[ngayketthuc] [nvarchar](50) NULL,
	[luongtt] [nvarchar](50) NULL
)
CREATE TABLE [dbo].[chucvu](
	[machucvu] [nvarchar](50)  primary key constraint idcv default dbo.auto_idcv(),
	[tenchucvu] [nvarchar](50),
	[phucap] [nvarchar](50) NULL,
	[ghichu] [nvarchar](50) NULL,
)
CREATE TABLE [dbo].[ngoaingu](
	[mangoaingu] [nvarchar](50)  primary key constraint idnn default dbo.auto_idnn(),
	[tenngoaingu] [nvarchar](50),
	[trinhdo] [nvarchar](50) NULL,
)
CREATE TABLE [dbo].[hocvan](
	[mahocvan] [nvarchar](50)  primary key constraint idhv default dbo.auto_idhv(),
	[chuyennganh] [nvarchar](50),
	[ghichu] [nvarchar](50) NULL,
)









CREATE FUNCTION auto_idpb()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(maphong) FROM phongban) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(maphong, 3)) FROM phongban
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'PB00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'PB0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

CREATE FUNCTION auto_idhd()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(mahopdong) FROM hopdong) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(mahopdong, 3)) FROM hopdong
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HD00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'HD0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

CREATE FUNCTION auto_id()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(manhanvien) FROM nhanvien) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(manhanvien, 3)) FROM nhanvien
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'NV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END


CREATE FUNCTION auto_idcv()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(machucvu) FROM chucvu) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(machucvu, 3)) FROM chucvu
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

CREATE FUNCTION auto_idnn()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(mangoaingu) FROM ngoaingu) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(mangoaingu, 3)) FROM ngoaingu
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NN00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'NN0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

CREATE FUNCTION auto_idhv()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(mahocvan) FROM hocvan) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(mahocvan, 3)) FROM hocvan
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'HV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END




