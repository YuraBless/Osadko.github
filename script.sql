USE [master]
GO
/****** Object:  Database [MedicalCenter]    Script Date: 04.01.2025 12:58:20 ******/
CREATE DATABASE [MedicalCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MedicalCenter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MedicalCenter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MedicalCenter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MedicalCenter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MedicalCenter] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MedicalCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MedicalCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MedicalCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MedicalCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MedicalCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MedicalCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [MedicalCenter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MedicalCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MedicalCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MedicalCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MedicalCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MedicalCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MedicalCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MedicalCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MedicalCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MedicalCenter] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MedicalCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MedicalCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MedicalCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MedicalCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MedicalCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MedicalCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MedicalCenter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MedicalCenter] SET RECOVERY FULL 
GO
ALTER DATABASE [MedicalCenter] SET  MULTI_USER 
GO
ALTER DATABASE [MedicalCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MedicalCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MedicalCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MedicalCenter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MedicalCenter] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MedicalCenter] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MedicalCenter', N'ON'
GO
ALTER DATABASE [MedicalCenter] SET QUERY_STORE = ON
GO
ALTER DATABASE [MedicalCenter] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MedicalCenter]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 04.01.2025 12:58:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[AppointmentDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentServices]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentServices](
	[AppointmentServiceID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[Location] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentStatistics]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentStatistics](
	[StatisticID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Month] [nvarchar](20) NOT NULL,
	[NumberOfPatients] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatisticID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnoses]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnoses](
	[DiagnosisID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NOT NULL,
	[DiagnosisDescription] [nvarchar](255) NOT NULL,
	[DiagnosisDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Specialization] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[DepartmentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorSchedules]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorSchedules](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[DayOfWeek] [nvarchar](10) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmergencyContacts]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyContacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[ContactName] [nvarchar](100) NOT NULL,
	[Relationship] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecords]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecords](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalServices]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalServices](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](100) NOT NULL,
	[ServiceCost] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[Address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[AppointmentID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentMethod] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescriptions]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescriptions](
	[PrescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[DiagnosisID] [int] NOT NULL,
	[Medicine] [nvarchar](100) NOT NULL,
	[Dosage] [nvarchar](50) NOT NULL,
	[Duration] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PrescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisitHistory]    Script Date: 04.01.2025 12:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitHistory](
	[VisitID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[VisitDate] [datetime] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[VisitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT ('Заплановано') FOR [Status]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[AppointmentServices]  WITH CHECK ADD FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[AppointmentServices]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[MedicalServices] ([ServiceID])
GO
ALTER TABLE [dbo].[DepartmentStatistics]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Diagnoses]  WITH CHECK ADD FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[DoctorSchedules]  WITH CHECK ADD FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[EmergencyContacts]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[MedicalRecords]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD FOREIGN KEY([DiagnosisID])
REFERENCES [dbo].[Diagnoses] ([DiagnosisID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[VisitHistory]  WITH CHECK ADD FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[VisitHistory]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
USE [master]
GO
ALTER DATABASE [MedicalCenter] SET  READ_WRITE 
GO
