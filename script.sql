USE [CAPLUGA]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  Table [dbo].[AppointmentScheduling]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  Table [dbo].[Detail]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  Table [dbo].[MasterPurchase]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  Table [dbo].[MedicalCourses]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  Table [dbo].[MedicalImplements]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  Table [dbo].[Registeredcourses]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  Table [dbo].[ScheduleAppointment]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 20/03/2024 12:41:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
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
ALTER TABLE [dbo].[AppointmentScheduling]  WITH CHECK ADD FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[AppointmentScheduling]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[AppointmentScheduling]  WITH CHECK ADD FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[ScheduleAppointment] ([ScheduleID])
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
/****** Object:  StoredProcedure [dbo].[InsertAppointment]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[InsertScheduleAppointment]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[PayCart]    Script Date: 20/03/2024 12:41:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PayCart]
	@UserID BIGINT
AS
BEGIN
	
	--IF (SELECT	P.Cantidad - C.Cantidad 
	--	FROM	TProducto	P
	--	INNER	JOIN	TCarrito  C	ON P.ConProducto = C.ConProducto
	--	WHERE	ConUsuario = @ConUsuario) >= 0

	IF (SELECT	TOP 1 P.Quantity - C.Quantity 
		FROM	MedicalImplements	P
		INNER	JOIN	Cart  C	ON P.MedicalImplementsID = C.MedicalImplementsID
		WHERE	UserID = @UserID) < 0
	BEGIN

		SELECT 'FALSE'
		
	END
	ELSE
	BEGIN

		DECLARE @TotalPurchase DECIMAL(18,2)
		DECLARE @MasterCode BIGINT
	
		SELECT	@TotalPurchase = SUM(P.Price * C.Quantity) + (SUM(P.Price * C.Quantity) * 0.13)
		FROM	Cart C
		INNER	JOIN MedicalImplements P ON C.MedicalImplementsID = P.MedicalImplementsID
		WHERE	UserID = @UserID

		INSERT INTO dbo.MasterPurchase(UserID,PurchaseDate,TotalPurchase)
		VALUES (@UserID, GETDATE(), @TotalPurchase)

		SET @MasterCode = @@IDENTITY

		INSERT INTO dbo.Detail(MasterPurchaseID,MedicalImplementsID,PaidPrice,PaidQuantity,Tax)
		SELECT	@MasterCode, C.MedicalImplementsID, P.Price, C.Quantity, P.Price * 0.13
		FROM	Cart C
		INNER	JOIN MedicalImplements P ON C.MedicalImplementsID = P.MedicalImplementsID
		WHERE	UserID = @UserID

		UPDATE	P
		SET		P.Quantity = P.Quantity - C.Quantity
		FROM	MedicalImplements P
		INNER	JOIN Cart C ON C.MedicalImplementsID = P.MedicalImplementsID
		WHERE	UserID = @UserID

		DELETE FROM Cart
		WHERE UserID = @UserID

		SELECT 'TRUE'

	END

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAppointment]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateScheduleAppointment]    Script Date: 20/03/2024 12:41:16 p. m. ******/
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
