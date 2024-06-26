USE [master]
GO
/****** Object:  Database [CAPLUGA]    Script Date: 4/10/2024 9:21:33 PM ******/
CREATE DATABASE [CAPLUGA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CAPLUGA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CAPLUGA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CAPLUGA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CAPLUGA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CAPLUGA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CAPLUGA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CAPLUGA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CAPLUGA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CAPLUGA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CAPLUGA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CAPLUGA] SET ARITHABORT OFF 
GO
ALTER DATABASE [CAPLUGA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CAPLUGA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CAPLUGA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CAPLUGA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CAPLUGA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CAPLUGA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CAPLUGA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CAPLUGA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CAPLUGA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CAPLUGA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CAPLUGA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CAPLUGA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CAPLUGA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CAPLUGA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CAPLUGA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CAPLUGA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CAPLUGA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CAPLUGA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CAPLUGA] SET  MULTI_USER 
GO
ALTER DATABASE [CAPLUGA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CAPLUGA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CAPLUGA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CAPLUGA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CAPLUGA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CAPLUGA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CAPLUGA] SET QUERY_STORE = ON
GO
ALTER DATABASE [CAPLUGA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CAPLUGA]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [bigint] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[ZipCode] [nvarchar](10) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[District] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentScheduling]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentScheduling](
	[AppointmentID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[AddressID] [bigint] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ScheduleID] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [bigint] IDENTITY(1,1) NOT NULL,
	[MedicalImplementsID] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UserID] [bigint] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail](
	[DetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[MedicalImplementsID] [bigint] NOT NULL,
	[PaidPrice] [decimal](18, 2) NOT NULL,
	[PaidQuantity] [int] NOT NULL,
	[Tax] [decimal](18, 2) NOT NULL,
	[MasterPurchaseID] [bigint] NOT NULL,
	[PaymentStatus] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogs](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[ErrorMessage] [varchar](max) NOT NULL,
	[Source] [varchar](255) NOT NULL,
	[AdditionalInformation] [nvarchar](max) NOT NULL,
	[UserID] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterPurchase]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterPurchase](
	[MasterPurchaseID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[TotalPurchase] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MasterPurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalCourses]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCourses](
	[MedicalCourseID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[State] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicalCourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalImplements]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalImplements](
	[MedicalImplementsID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[State] [bit] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicalImplementsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registeredcourses]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registeredcourses](
	[RegisteredcoursesID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[MedicalCourseID] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Registrationdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Registeredcourses] PRIMARY KEY CLUSTERED 
(
	[RegisteredcoursesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolesID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleAppointment]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleAppointment](
	[ScheduleID] [bigint] IDENTITY(1,1) NOT NULL,
	[Dname] [nvarchar](100) NOT NULL,
	[DateandTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Surnames] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[State] [bit] NOT NULL,
	[Age] [date] NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[RolesID] [bigint] NOT NULL,
	[AddressID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Detail] ADD  DEFAULT ('Pending') FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[AppointmentScheduling]  WITH CHECK ADD FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[AppointmentScheduling]  WITH CHECK ADD FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[ScheduleAppointment] ([ScheduleID])
GO
ALTER TABLE [dbo].[AppointmentScheduling]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([MedicalImplementsID])
REFERENCES [dbo].[MedicalImplements] ([MedicalImplementsID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[Detail]  WITH CHECK ADD FOREIGN KEY([MasterPurchaseID])
REFERENCES [dbo].[MasterPurchase] ([MasterPurchaseID])
GO
ALTER TABLE [dbo].[Detail]  WITH CHECK ADD FOREIGN KEY([MedicalImplementsID])
REFERENCES [dbo].[MedicalImplements] ([MedicalImplementsID])
GO
ALTER TABLE [dbo].[ErrorLogs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[MasterPurchase]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Registeredcourses]  WITH CHECK ADD  CONSTRAINT [FK_Registeredcourses_MedicalCourses] FOREIGN KEY([MedicalCourseID])
REFERENCES [dbo].[MedicalCourses] ([MedicalCourseID])
GO
ALTER TABLE [dbo].[Registeredcourses] CHECK CONSTRAINT [FK_Registeredcourses_MedicalCourses]
GO
ALTER TABLE [dbo].[Registeredcourses]  WITH CHECK ADD  CONSTRAINT [FK_Registeredcourses_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Registeredcourses] CHECK CONSTRAINT [FK_Registeredcourses_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RolesID])
REFERENCES [dbo].[Roles] ([RolesID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Addresses] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Addresses]
GO
/****** Object:  StoredProcedure [dbo].[ApprovePaymentDetails]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ApprovePaymentDetails]
    @MasterPurchaseID BIGINT
AS
BEGIN
    UPDATE Detail
    SET PaymentStatus = 'APROBADO'
    WHERE MasterPurchaseID = @MasterPurchaseID AND PaymentStatus = 'PENDIENTE';
    
    UPDATE MedicalImplements
    SET Quantity = Quantity - D.PaidQuantity
    FROM MedicalImplements M
    INNER JOIN Detail D ON M.MedicalImplementsID = D.MedicalImplementsID
    WHERE D.MasterPurchaseID = @MasterPurchaseID AND D.PaymentStatus = 'APROBADO';

END
GO
/****** Object:  StoredProcedure [dbo].[InsertAppointment]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAppointment]
    @UserID BIGINT,
    @AddressID BIGINT,
    @Name NVARCHAR(100),
    @Description NVARCHAR(MAX),
@ScheduleID BIGINT
AS
BEGIN
    INSERT INTO AppointmentScheduling (UserID, AddressID, Name, Description, ScheduleID)
    VALUES (@UserID, @AddressID, @Name, @Description, @ScheduleID)
    
 
END
GO
/****** Object:  StoredProcedure [dbo].[InsertScheduleAppointment]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertScheduleAppointment]
    -- Parámetros para el procedimiento almacenado
    @Dname NVARCHAR(100),
    @DateandTime DATETIME
AS
BEGIN
    -- Insertar el nuevo registro en la tabla
    INSERT INTO ScheduleAppointment (Dname, DateandTime)
    VALUES (@Dname, @DateandTime)
   
END
GO
/****** Object:  StoredProcedure [dbo].[PayCart]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PayCart]
    @UserID BIGINT
AS
BEGIN

IF (SELECT	TOP 1 P.Quantity - C.Quantity 
		FROM	MedicalImplements	P
		INNER	JOIN	Cart  C	ON P.MedicalImplementsID = C.MedicalImplementsID
		WHERE	UserID = @UserID) < 0
	BEGIN

		SELECT 'FALSE'
		
	END
	ELSE
	BEGIN

    DECLARE @TotalPurchase DECIMAL(18,2);
    DECLARE @MasterCode BIGINT;
    
    SELECT @TotalPurchase = SUM(P.Price * C.Quantity) + (SUM(P.Price * C.Quantity) * 0.13)
    FROM Cart C
    INNER JOIN MedicalImplements P ON C.MedicalImplementsID = P.MedicalImplementsID
    WHERE C.UserID = @UserID;

    INSERT INTO dbo.MasterPurchase(UserID, PurchaseDate, TotalPurchase)
    VALUES (@UserID, GETDATE(), @TotalPurchase);

    SET @MasterCode = SCOPE_IDENTITY();

    INSERT INTO dbo.Detail(MasterPurchaseID, MedicalImplementsID, PaidPrice, PaidQuantity, Tax, PaymentStatus)
    SELECT @MasterCode, C.MedicalImplementsID, P.Price, C.Quantity, P.Price * 0.13, 'PENDIENTE'
    FROM Cart C
    INNER JOIN MedicalImplements P ON C.MedicalImplementsID = P.MedicalImplementsID
    WHERE C.UserID = @UserID;

    DELETE FROM Cart WHERE UserID = @UserID;

    SELECT 'TRUE'
END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAppointment]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateAppointment]
    @AppointmentID BIGINT,
    @UserID BIGINT,
    @AddressID BIGINT,
    @Name NVARCHAR(100),
    @Description NVARCHAR(MAX),
	 @ScheduleID BIGINT
AS
BEGIN
    UPDATE dbo.AppointmentScheduling
    SET Name = @Name,
        Description = @Description,
		ScheduleID = @ScheduleID
    WHERE AppointmentID = @AppointmentID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateScheduleAppointment]    Script Date: 4/10/2024 9:21:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateScheduleAppointment]
    @ScheduleID BIGINT,
    @DName NVARCHAR(100),
    @DateandTime DATETIME
AS
BEGIN

        UPDATE dbo.ScheduleAppointment
        SET Dname = @DName,
           DateandTime = @DateandTime
        WHERE ScheduleID = @ScheduleID;
    END
GO
USE [master]
GO
ALTER DATABASE [CAPLUGA] SET  READ_WRITE 
GO
