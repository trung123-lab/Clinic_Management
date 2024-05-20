CREATE TABLE [dbo].[Account](
	[AccountID] [int] Identity(1,1) NOT NULL,
	[UserName] [varchar](50) Primary key,
	[Password] [varchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Phone] [decimal](18, 0) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL)

	CREATE TABLE [dbo].[Admin](
	[AdminID] [int] identity(1,1) PRIMARY KEY,
	[AccountID] [int] NOT NULL)

	CREATE TABLE [dbo].[AvailableSlot](
	[SlotID] [int] identity(1,1) PRIMARY KEY,
	[Time] [nvarchar](50) NOT NULL)

	CREATE TABLE [dbo].[Booking](
	[BookingID] [int] identity(1,1) PRIMARY KEY,
	[Status] [int] NOT NULL,
	[TotalPrice] [money] NOT NULL,
	[CustomerID] [int] NOT NULL)

	CREATE TABLE [dbo].[BookingDetail](
	[BookingIdDetail] [int] identity(1,1) PRIMARY KEY,
	[DateBook] [datetime] NOT NULL,
	[TypeBook] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[SlotID] [int] NOT NULL,
	[DentistID] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[PriceBooking] [money] NOT NULL,
	[MedicalDay] [datetime] NOT NULL,
	[BookingID] [int] NOT NULL)

	CREATE TABLE [dbo].[Clinic](
	[ClinicID] [int] identity(1,1) PRIMARY KEY,
	[ClinicName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[OpenTime] [time](7) NOT NULL,
	[CloseTime] [time](7) NOT NULL,
	[LocationID] [int] NOT NULL)

	CREATE TABLE [dbo].[ClinicOwner](
	[ClinicOwnerID] [int] identity(1,1) PRIMARY KEY,
	[ClinicID] [int] NOT NULL,
	[ClinicOwnerName] [nvarchar](50) NOT NULL,
	[AccountID] [int] NOT NULL)

	CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] identity(1,1) PRIMARY KEY,
	[CustomerName] [nvarchar](50) NOT NULL,
	[AccountID] [int] NOT NULL)

	CREATE TABLE [dbo].[Dentist](
	[DentistID] [int] identity(1,1) PRIMARY KEY,
	[DentistName] [nvarchar](50) NOT NULL,
	[AccountID] [int] NOT NULL,
	[ClinicID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL)

	CREATE TABLE [dbo].[Location](
	[LocationID] [int] identity(1,1) PRIMARY KEY,
	[LocationName] [nvarchar](max) NOT NULL)

	CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] identity(1,1) PRIMARY KEY,
	[Status] [bit] NOT NULL,
	[BookingID] [int] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL)

	CREATE TABLE [dbo].[PendingApproval](
	[PendingID] [int] identity(1,1) PRIMARY KEY,
	[AccountID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[PendingInfo] [nvarchar](50) NOT NULL)

	CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL)

	CREATE TABLE [dbo].[Treatment](
	[TreatmentID] [int] identity(1,1) PRIMARY KEY,
	[BookingDetailID] [int] NOT NULL,
	[TreatmentDate] [datetime] NOT NULL,
	[Note] [nvarchar](50) NULL,
	[Result] [nvarchar](50) NOT NULL)


INSERT INTO [dbo].[Account] ([UserName], [Password], [RoleID], [Phone], [Email], [IsActive])
VALUES
    ('customer1', 'customer_password1', 1, 9876543210, 'customer1@example.com', 1),
    ('customer2', 'customer_password2', 1, 6543217890, 'customer2@example.com', 1),
    ('dentist1', 'dentist_password1', 2, 4567891230, 'dentist1@example.com', 1),
    ('dentist2', 'dentist_password2', 2, 7891234560, 'dentist2@example.com', 1),
    ('owner1', 'clinic_owner_password1', 3, 3216549870, 'clinic_owner1@example.com', 1),
    ('owner2', 'clinic_owner_password2', 3, 9876543210, 'clinic_owner2@example.com', 1),
	('admin', 'admin_password', 4, 1234567890, 'admin@example.com', 1);


	-- Role table
INSERT INTO [dbo].[Role] ([RoleID], [RoleName])
VALUES
   
    (1, 'Customer'),
    (2, 'Dentist'),
    (3, 'Clinic Owner'),
	(4, 'Admin');
	-- Location table
INSERT INTO [dbo].[Location] ([LocationName])
VALUES
    ('Location 1'),
    ('Location 2'),
    ('Location 3');

-- Admin table
INSERT INTO [dbo].[Admin] ([AccountID])
VALUES
    (7);

-- Customer table
INSERT INTO [dbo].[Customer] ([CustomerName], [AccountID])
VALUES
    ('Customer 1', 1),
    ('Customer 2', 2);

-- Dentist table
INSERT INTO [dbo].[Dentist] ([DentistName], [AccountID], [ClinicID], [Description])
VALUES
    ('Dentist 1', 3, 1, 'Experienced dentist specialized in root canals.'),
    ('Dentist 2', 4, 2, 'Skilled dentist with expertise in cosmetic dentistry.');

-- Clinic table
INSERT INTO [dbo].[Clinic] ([ClinicName], [Address], [OpenTime], [CloseTime], [LocationID])
VALUES
    ('Clinic 1', 'Address 1', '08:00:00', '17:00:00', 1),
    ('Clinic 2', 'Address 2', '09:00:00', '18:00:00', 2);

-- ClinicOwner table
INSERT INTO [dbo].[ClinicOwner] ([ClinicID], [ClinicOwnerName], [AccountID])
VALUES
    ( 1, 'Owner 1', 5),
    ( 2, 'Owner 2', 6);

-- AvailableSlot table
  
INSERT INTO [dbo].[AvailableSlot] ([Time])
VALUES
    ('07:00'),
    ('08:00'),
	('09:00'),
    ('10:00'),
    ('11:00'),
    ('12:00'),
	('13:00'),
    ('14:00'),
    ('15:00'),
	('16:00'),
    ('17:00'),
    ('18:00'),
	('19:00');
-- Booking table
INSERT INTO [dbo].[Booking] ([Status], [TotalPrice], [CustomerID])
VALUES
    ( 1, 150.00, 1),
    ( 1, 200.00, 2);

-- BookingDetail table
INSERT INTO [dbo].[BookingDetail] ([DateBook], [TypeBook], [Status], [SlotID], [DentistID], [ClinicID], [PriceBooking], [MedicalDay], [BookingID])
VALUES
    ('2024-05-15', 'Checkup', 1, 3, 1, 1, 80.00, '2024-05-16', 1),
    ('2024-05-16', 'Treatment', 1, 4, 1, 1, 120.00, '2024-05-17', 2);

-- Payment table
INSERT INTO [dbo].[Payment] ([Status], [BookingID], [PaymentMethod])
VALUES
    (1, 1, 'Credit Card'),
    (1, 2, 'Momo');

-- PendingApproval table
INSERT INTO [dbo].[PendingApproval] ([AccountID], [Status], [PendingInfo])
VALUES
    (1, 0, 'New customer registration request'),
    (4, 0, 'New dentist registration request');

-- Treatment table
INSERT INTO [dbo].[Treatment] ([BookingDetailID], [TreatmentDate], [Note], [Result])
VALUES
    ( 1, '2024-05-16', 'Regular checkup', 'No issues detected'),
    ( 2, '2024-05-17', 'Tooth filling', 'Successful');
	