
	CREATE DATABASE [Student Grading Management Subsystem]

	USE [Student Grading Management Subsystem]

	CREATE TABLE Students (
		[Mssv] [varchar](50) NOT NULL PRIMARY KEY,
		[Email] [varchar](150) NOT NULL,
		[First Name] [nvarchar](50) NOT NULL,
		[Last Name] [nvarchar](150) NOT NULL,
		[Gender] [bit] NOT NULL,
		[Date of Birth] [date] NOT NULL,
	)

	CREATE TABLE Groups (
		[GrID] [varchar](50) NOT NULL PRIMARY KEY,
		[Major] [varchar](50) NOT NULL,
		[Number of Students] [int] NOT NULL,
	)

	CREATE TABLE [Join] (
		[Mssv] [varchar](50) NOT NULL,
		[GrID] [varchar](50) NOT NULL,	
	
		CONSTRAINT [PK_Join] PRIMARY KEY (Mssv, GrID),
		CONSTRAINT [FK_Join_Groups] FOREIGN KEY([GrID]) REFERENCES [dbo].[Groups] ([GrID]),
		CONSTRAINT [FK_Join_Students] FOREIGN KEY([Mssv]) REFERENCES [dbo].[Students] ([Mssv])
	)

	CREATE TABLE Lecturers (
		[LecID] [varchar](50) NOT NULL PRIMARY KEY,
		[Email] [varchar](150) NOT NULL,
		[First Name] [nvarchar](50) NOT NULL,
		[Last Name] [nvarchar](150) NOT NULL,
		[Gender] [bit] NOT NULL,
		[Date of Birth] [date] NOT NULL,
		[Report] [varchar](50) NULL,

		CONSTRAINT [FK_Lecturers_Lecturers] FOREIGN KEY([Report]) REFERENCES [dbo].[Lecturers] ([LecID]),
	)

	CREATE TABLE Courses (
		[CouID] [varchar](50) NOT NULL PRIMARY KEY,
		[Name] [varchar](50) NOT NULL,
	)

	CREATE TABLE Assignment (
		[AsnID] [varchar](50) NOT NULL PRIMARY KEY,
		[Major] [varchar](50) NOT NULL,
		[Lecturer] [varchar](50) NOT NULL,

		CONSTRAINT [FK_Assignment_Courses] FOREIGN KEY([Major]) REFERENCES [dbo].[Courses] ([CouID]),
		CONSTRAINT [FK_Assignment_Lecturers] FOREIGN KEY([Lecturer]) REFERENCES [dbo].[Lecturers] ([LecID]),
	)

	CREATE TABLE Classes (
		[ClassID] [varchar](50) NOT NULL PRIMARY KEY,
		[AsnID] [varchar](50) NOT NULL,
		[Semester] [varchar](50) NOT NULL,
		[Start Date] [date] NOT NULL,
		[End Date] [date] NOT NULL,

		CONSTRAINT [FK_Classes_Assignment] FOREIGN KEY([AsnID]) REFERENCES [dbo].[Assignment] ([AsnID]),

	)

	CREATE TABLE Enroll (
		[ClassID] [varchar](50) NOT NULL,
		[GrID] [varchar](50) NOT NULL,

		CONSTRAINT [PK_Enroll] PRIMARY KEY (ClassID, GrID),
		CONSTRAINT [FK_Enroll_Classes] FOREIGN KEY([ClassID]) REFERENCES [dbo].[Classes] ([ClassID]),
		CONSTRAINT [FK_Enroll_Groups] FOREIGN KEY([GrID]) REFERENCES [dbo].[Groups] ([GrID])
	)

	CREATE TABLE Categories (
		[CatID] [varchar](50) NOT NULL PRIMARY KEY ,
		[Name] [varchar](50) NOT NULL,
		[Type] [varchar](50) NOT NULL,
		[Completion Criteria] [varchar](50) NOT NULL,
	)

	CREATE TABLE [Assessment System] (
		[AsID] [varchar](50) NOT NULL PRIMARY KEY,
		[CatID] [varchar](50) NOT NULL,
		[CouID] [varchar](50) NOT NULL,
		[Number of Questions] [int] NOT NULL,
		[Duration] [varchar](50) NOT NULL,
		[Weight] [float] NOT NULL,

		CONSTRAINT [FK_Assessment System_Categories] FOREIGN KEY([CatID]) REFERENCES [dbo].[Categories] ([CatID]),
		CONSTRAINT [FK_Assessment System_Courses] FOREIGN KEY([CouID]) REFERENCES [dbo].[Courses] ([CouID]),

	)

	CREATE TABLE Grade (
		[Mssv] [varchar](50) NOT NULL,
		[AsID] [varchar](50) NOT NULL,
		[Score] [float] NOT NULL,
		[Date] [date] NOT NULL,

		CONSTRAINT [FK_Grade_Assessment System] FOREIGN KEY([AsID]) REFERENCES [dbo].[Assessment System] ([AsID]),
		CONSTRAINT [FK_Grade_Students] FOREIGN KEY([Mssv]) REFERENCES [dbo].[Students] ([Mssv])

		CONSTRAINT [PK_Grade] PRIMARY KEY (Mssv, AsID, [Date]),
	)

	CREATE TABLE [View] (
		[Mssv] [varchar](50) NOT NULL,
		[ClassID] [varchar](50) NOT NULL,
		[Average] [float] NOT NULL,
		[Status] [varchar](50) NOT NULL,
 
		CONSTRAINT [PK_View] PRIMARY KEY (Mssv, ClassID),
		CONSTRAINT [FK_View_Classes] FOREIGN KEY([ClassID]) REFERENCES [dbo].[Classes] ([ClassID]),
		CONSTRAINT [FK_View_Students] FOREIGN KEY([Mssv]) REFERENCES [dbo].[Students] ([Mssv]),
	)

	CREATE TABLE Assess (
		[AsID] [varchar](50) NOT NULL,
		[ClassID] [varchar](50) NOT NULL,
	
		CONSTRAINT [PK_Assess] PRIMARY KEY (AsID, ClassID),
		CONSTRAINT [FK_Assess_Assessment System] FOREIGN KEY([AsID]) REFERENCES [dbo].[Assessment System] ([AsID]),
		CONSTRAINT [FK_Assess_Classes] FOREIGN KEY([ClassID]) REFERENCES [dbo].[Classes] ([ClassID])
	)


INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00027', 'anv@fpt.edu.vn', 'A', N'Nguyễn Thị', 0, CAST('02-01-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00028', 'bnv@fpt.edu.vn', 'B', N'Nguyễn Thị', 0, CAST('02-02-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00029', 'cnv@fpt.edu.vn', 'C', N'Nguyễn Thị', 0, CAST('02-03-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00030', 'dnv@fpt.edu.vn', 'D', N'Nguyễn Thị', 0, CAST('02-04-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00031', 'env@fpt.edu.vn', 'E', N'Nguyễn Thị', 0, CAST('02-05-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00032', 'fnv@fpt.edu.vn', 'F', N'Nguyễn Thị', 0, CAST('02-06-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00033', 'gnv@fpt.edu.vn', 'G', N'Nguyễn Thị', 0, CAST('02-07-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00039', 'nnv@fpt.edu.vn', 'N', N'Nguyễn Thị', 0, CAST('02-14-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00040', 'onv@fpt.edu.vn', 'O', N'Nguyễn Thị', 0, CAST('02-15-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00041', 'pnv@fpt.edu.vn', 'P', N'Nguyễn Thị', 0, CAST('02-16-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00042', 'qnv@fpt.edu.vn', 'Q', N'Nguyễn Thị', 0, CAST('02-17-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00043', 'rnv@fpt.edu.vn', 'R', N'Nguyễn Thị', 0, CAST('02-18-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00044', 'snv@fpt.edu.vn', 'S', N'Nguyễn Thị', 0, CAST('02-19-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00045', 'tnv@fpt.edu.vn', 'T', N'Nguyễn Thị', 0, CAST('02-20-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00046', 'unv@fpt.edu.vn', 'U', N'Nguyễn Thị', 0, CAST('02-21-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00047', 'vnv@fpt.edu.vn', 'V', N'Nguyễn Thị', 0, CAST('02-22-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00048', 'wnv@fpt.edu.vn', 'W', N'Nguyễn Thị', 0, CAST('02-23-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00049', 'xnv@fpt.edu.vn', 'X', N'Nguyễn Thị', 0, CAST('02-24-2002' AS DATE));
INSERT Students(Mssv, Email, [First Name], [Last Name], Gender, [Date of Birth]) VALUES ('HE00050', 'ynv@fpt.edu.vn', 'Y', N'Nguyễn Thị', 0, CAST('02-25-2002' AS DATE));


SELECT * FROM Students

INSERT Groups(GrID, Major, [Number of Students]) VALUES ('IA1604', 'Information Assurance', 15);
INSERT Groups(GrID, Major, [Number of Students]) VALUES ('AI1605', 'Artificial Intelligence', 15);
INSERT Groups(GrID, Major, [Number of Students]) VALUES ('SE1606', 'Software Engineering', 20);
INSERT Groups(GrID, Major, [Number of Students]) VALUES ('IOT1607', 'Internet of Things', 15);
INSERT Groups(GrID, Major, [Number of Students]) VALUES ('IA1608', 'Information Assurance', 10);
INSERT Groups(GrID, Major, [Number of Students]) VALUES ('SE1609', 'Software Engineering', 20);


SELECT * FROM Groups

INSERT [Join](Mssv, GrID) VALUES ('HE00001', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00002', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00003', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00004', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00005', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00006', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00007', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00008', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00009', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00010', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00011', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00012', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00013', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00014', 'IA1604');
INSERT [Join](Mssv, GrID) VALUES ('HE00015', 'IA1604');

INSERT [Join](Mssv, GrID) VALUES ('HE00016', 'AI1605');
INSERT [Join](Mssv, GrID) VALUES ('HE00017', 'AI1605');
INSERT [Join](Mssv, GrID) VALUES ('HE00018', 'AI1605');
INSERT [Join](Mssv, GrID) VALUES ('HE00019', 'AI1605');
INSERT [Join](Mssv, GrID) VALUES ('HE00020', 'AI1605');
INSERT [Join](Mssv, GrID) VALUES ('HE00021', 'AI1605');
INSERT [Join](Mssv, GrID) VALUES ('HE00022', 'AI1605');
INSERT [Join](Mssv, GrID) VALUES ('HE00029', 'AI1605');
INSERT [Join](Mssv, GrID) VALUES ('HE00030', 'AI1605');

INSERT [Join](Mssv, GrID) VALUES ('HE00031', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00032', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00033', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00034', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00035', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00036', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00037', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00038', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00046', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00047', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00048', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00049', 'SE1606');
INSERT [Join](Mssv, GrID) VALUES ('HE00050', 'SE1606');

SELECT * FROM [Join]


SELECT * FROM Courses

INSERT Lecturers(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVA', 'gva@fe.edu.vn', 'A', N'Giảng Viên', 1, CAST('01-01-1985' AS date), NULL);
INSERT Lecturers(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVB', 'gvb@fe.edu.vn', 'B', N'Giảng Viên', 0, CAST('01-02-1985' AS date), 'GVA');
INSERT Lecturers(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVC', 'gvc@fe.edu.vn', 'C', N'Giảng Viên', 1, CAST('01-03-1985' AS date), 'GVA');
INSERT Lecturers(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVG', 'gvg@fe.edu.vn', 'G', N'Giảng Viên', 1, CAST('01-07-1985' AS date), 'GVF');
INSERT Lecturers(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVH', 'gvh@fe.edu.vn', 'H', N'Giảng Viên', 0, CAST('01-08-1985' AS date), NULL);
INSERT Lecturers(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVI', 'gvi@fe.edu.vn', 'I', N'Giảng Viên', 1, CAST('01-09-1985' AS date), 'GVH');
INSERT Lecturers(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVJ', 'gvj@fe.edu.vn', 'J', N'Giảng Viên', 0, CAST('01-10-1985' AS date), 'GVH');
INSERT Lecturers(LecID, Email, [First Name], [Last Name], Gender, [Date of Birth], Report) VALUES ('GVK', 'gvk@fe.edu.vn', 'K', N'Giảng Viên', 1, CAST('01-11-1985' AS date), 'GVH');


SELECT * FROM Lecturers


INSERT Assignment(AsnID, Major, Lecturer) VALUES ('ACSD', 'CSD201', 'GVA');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('BIAO', 'IAO202', 'GVB');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('CLAB', 'LAB211', 'GVC');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('DLAB', 'LAB211', 'GVD');

INSERT Assignment(AsnID, Major, Lecturer) VALUES ('FJPD', 'JPD113', 'GVF');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('GJPD', 'JPD113', 'GVG');


INSERT Assignment(AsnID, Major, Lecturer) VALUES ('IMAE', 'MAE101', 'GVI');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('JMAE', 'MAE101', 'GVJ');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('ISSL', 'SSL101c', 'GVI');

INSERT Assignment(AsnID, Major, Lecturer) VALUES ('JMAD', 'MAD101', 'GVJ');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('BNWC', 'NWC204', 'GVB');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('HOSG', 'OSG202', 'GVH');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('FSSG', 'SSG104', 'GVF');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('GSSG', 'SSG104', 'GVG');
INSERT Assignment(AsnID, Major, Lecturer) VALUES ('APRO', 'PRO192', 'GVA');


SELECT * FROM Assignment


INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22ACSD', 'ACSD', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22CLAB', 'CLAB', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22DLAB', 'DLAB', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22FJPD', 'FJPD', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22GJPD', 'GJPD', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));

INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22JMAD', 'JMAD', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22BNWC', 'BNWC', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22HOSG', 'HOSG', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22FSSG', 'FSSG', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22GSSG', 'GSSG', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22APRO', 'APRO', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));

INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22HCEA', 'HCEA', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22JCEA', 'JCEA', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22KCSI', 'KCSI', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22IMAE', 'IMAE', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22HPRF', 'HPRF', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SP22ISSL', 'ISSL', 'SPRING 2022', CAST('01-01-2022' AS date), CAST('04-01-2022' AS date));

INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21ECSD', 'ECSD', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21BIAO', 'BIAO', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21CLAB', 'CLAB', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));

INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21ICSI', 'ICSI', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21IMAE', 'IMAE', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21ISSL', 'ISSL', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21HPRF', 'HPRF', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));

INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21JMAD', 'JMAD', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21BNWC', 'BNWC', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21HOSG', 'HOSG', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21GSSG', 'GSSG', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('FA21APRO', 'APRO', 'FALL 2021', CAST('09-01-2021' AS date), CAST('12-01-2021' AS date));

INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21JCEA', 'JCEA', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21KCSI', 'KCSI', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21ISSL', 'ISSL', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));

INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21JMAD', 'JMAD', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21BNWC', 'BNWC', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21HOSG', 'HOSG', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21FSSG', 'FSSG', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21APRO', 'APRO', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));

INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21ACSD', 'ACSD', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21ADBI', 'ADBI', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21BIAO', 'BIAO', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21CLAB', 'CLAB', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));
INSERT Classes(ClassID, AsnID, Semester, [Start Date], [End Date]) VALUES ('SU21FJPD', 'FJPD', 'SUMMER 2021', CAST('05-01-2021' AS date), CAST('08-01-2021' AS date));


SELECT * FROM Classes
SELECT * FROM Groups

INSERT Enroll(ClassID, GrID) VALUES ('SU21KCSI', 'IA1604')
INSERT Enroll(ClassID, GrID) VALUES ('SU21IMAE', 'IA1604')
INSERT Enroll(ClassID, GrID) VALUES ('SU21JCEA', 'IA1604')
INSERT Enroll(ClassID, GrID) VALUES ('FA21JMAD', 'IA1604')
INSERT Enroll(ClassID, GrID) VALUES ('SP22BCSD', 'IA1604')
INSERT Enroll(ClassID, GrID) VALUES ('SP22ADBI', 'IA1604')
INSERT Enroll(ClassID, GrID) VALUES ('SP22FJPD', 'IA1604')
INSERT Enroll(ClassID, GrID) VALUES ('SP22BIAO', 'IA1604')
INSERT Enroll(ClassID, GrID) VALUES ('SP22CLAB', 'IA1604')

INSERT Enroll(ClassID, GrID) VALUES ('FA21IMAE', 'IA1608')
INSERT Enroll(ClassID, GrID) VALUES ('FA21ICSI', 'IA1608')
INSERT Enroll(ClassID, GrID) VALUES ('FA21HPRF', 'IA1608')
INSERT Enroll(ClassID, GrID) VALUES ('FA21ISSL', 'IA1608')

INSERT Enroll(ClassID, GrID) VALUES ('SP22IMAE', 'AI1605')
INSERT Enroll(ClassID, GrID) VALUES ('SP22HPRF', 'AI1605')
INSERT Enroll(ClassID, GrID) VALUES ('SP22ISSL', 'AI1605')
INSERT Enroll(ClassID, GrID) VALUES ('SP22JCEA', 'AI1605')
INSERT Enroll(ClassID, GrID) VALUES ('SP22KCSI', 'AI1605')

INSERT Enroll(ClassID, GrID) VALUES ('FA21DDBI', 'IOT1607')
INSERT Enroll(ClassID, GrID) VALUES ('FA21ECSD', 'IOT1607')
INSERT Enroll(ClassID, GrID) VALUES ('FA21CLAB', 'IOT1607')
INSERT Enroll(ClassID, GrID) VALUES ('FA21FJPD', 'IOT1607')
INSERT Enroll(ClassID, GrID) VALUES ('FA21BIAO', 'IOT1607')


SELECT * FROM Enroll


INSERT Categories(CatID, [Name], [Type], [Completion Criteria]) VALUES ('AS', 'Assignment ', 'On-Going', '>0');
INSERT Categories(CatID, [Name], [Type], [Completion Criteria]) VALUES ('LAB', 'Lab', 'On-Going', '>0');
INSERT Categories(CatID, [Name], [Type], [Completion Criteria]) VALUES ('LOC', 'Line of Code', 'On-Going', '>=750');
INSERT Categories(CatID, [Name], [Type], [Completion Criteria]) VALUES ('PT', 'Progress Test', 'On-Going', '>0');
INSERT Categories(CatID, [Name], [Type], [Completion Criteria]) VALUES ('PE', 'Practical Exam', 'On-Going', '>0');
INSERT Categories(CatID, [Name], [Type], [Completion Criteria]) VALUES ('FE', 'Final Exam', 'Final Exam', '>4');
INSERT Categories(CatID, [Name], [Type], [Completion Criteria]) VALUES ('FER', 'Final Exam Retake', 'Final Exam', '>4');


SELECT * FROM Categories

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CEAAS1', 'AS1', 'CEA201', 20, '30 mins', 0.1); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CEAAS2', 'AS2', 'CEA201', 20, '30 mins', 0.1); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CEAPT1', 'PT1', 'CEA201', 30, '60 mins', 0.2); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CEAPT2', 'PT2', 'CEA201', 30, '60 mins', 0.2); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CEAFE', 'FE', 'CEA201', 50, '90 mins', 0.4); 

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CSDLAB1', 'LAB1', 'CSD201', 10, '30 mins', 0.05); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CSDFE', 'FE', 'CSD201', 50, '90 mins', 0.4); 

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CSIAS1', 'AS1', 'CSI104', 20, '30 mins', 0.05); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CSIAS2', 'AS2', 'CSI104', 20, '30 mins', 0.05); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CSIPT2', 'PT2', 'CSI104', 30, '60 mins', 0.15); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('CSIFE', 'FE', 'CSI104', 60, '90 mins', 0.4); 

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('DBIAS', 'AS', 'DBI202', 10, '28 Slots', 0.2); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('IAOLAB1', 'LAB1', 'IAO202', 15, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('IAOLAB2', 'LAB2', 'IAO202', 15, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('IAOAS', 'AS', 'IAO202', 30, '45 mins', 0.1);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('IAOPT1', 'PT1', 'IAO202', 40, '60 mins', 0.2);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('IAOPT2', 'PT2', 'IAO202', 40, '60 mins', 0.2);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('IAOFE', 'FE', 'IAO202', 60, '90 mins', 0.4);

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('JPDAS1', 'AS1', 'JPD113', 10, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('JPDAS2', 'AS2', 'JPD113', 10, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('JPDPT2', 'PT2', 'JPD113', 30, '60 mins', 0.2);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('JPDFE', 'FE', 'JPD113', 10, '30 mins', 0.4);

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('LABLOC', 'LOC', 'LAB211', 75, '30 Slots', 1);

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MADAS1', 'AS1', 'MAD101', 10, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MADAS2', 'AS2', 'MAD101', 10, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MADLAB1', 'LAB1', 'MAD101', 15, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MADPT2', 'PT2', 'MAD101', 30, '60 mins', 0.2);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MADFE', 'FE', 'MAD101', 10, '30 mins', 0.4);

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MAEAS1', 'AS1', 'MAE101', 10, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MAEAS2', 'AS2', 'MAE101', 10, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MAELAB1', 'LAB1', 'MAE101', 15, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MAELAB2', 'LAB2', 'MAE101', 15, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MAEPT1', 'PT1', 'MAE101', 30, '60 mins', 0.2);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MAEPT2', 'PT2', 'MAE101', 30, '60 mins', 0.2);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('MAEFE', 'FE', 'MAE101', 10, '30 mins', 0.4);

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('NWCLAB1', 'LAB1', 'NWC204', 15, '30 mins', 0.05);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('NWCPT2', 'PT2', 'NWC204', 40, '60 mins', 0.2);
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('NWCFE', 'FE', 'NWC204', 60, '90 mins', 0.4);

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('OSGLAB1', 'LAB1', 'OSG202', 10, '30 mins', 0.05); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('OSGLAB2', 'LAB2', 'OSG202', 10, '30 mins', 0.05); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('OSGAS', 'AS', 'OSG202', 25, '30 mins', 0.1); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('OSGPT', 'PT', 'OSG202', 35, '60 mins', 0.1); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('OSGPE', 'PE', 'OSG202', 15, '90 mins', 0.3); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('OSGFE', 'FE', 'OSG202', 50, '90 mins', 0.4);

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('PRFFE', 'FE', 'PRF192', 50, '90 mins', 0.4);

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('PROLAB1', 'LAB1', 'PRO192', 10, '30 mins', 0.05); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('PROPE', 'PE', 'PRO192', 15, '90 mins', 0.3); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('PROFE', 'FE', 'PRO192', 50, '90 mins', 0.4);

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('SSGAS1', 'AS1', 'SSG104', 20, '30 mins', 0.1); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('SSGAS2', 'AS2', 'SSG104', 20, '30 mins', 0.1); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('SSGPT1', 'PT1', 'SSG104', 30, '60 mins', 0.2); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('SSGPT2', 'PT2', 'SSG104', 30, '60 mins', 0.2); 
INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('SSGFE', 'FE', 'SSG104', 50, '90 mins', 0.4); 

INSERT [Assessment System](AsID, CatID, CouID, [Number of Questions], Duration, [Weight]) VALUES ('SSLFE', 'FE', 'SSL101c', 50, '90 mins', 0.4); 


SELECT * FROM [Assessment System]
SELECT * FROM Classes

INSERT Assess(AsID, ClassID) VALUES ('PROAS', 'FA21APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROLAB1', 'FA21APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROLAB2', 'FA21APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROPT', 'FA21APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROPE', 'FA21APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROFE', 'FA21APRO')

INSERT Assess(AsID, ClassID) VALUES ('IAOLAB1', 'FA21BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOLAB2', 'FA21BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOAS', 'FA21BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOPT1', 'FA21BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOPT2', 'FA21BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOFE', 'FA21BIAO');

INSERT Assess(AsID, ClassID) VALUES ('NWCAS', 'FA21BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCLAB1', 'FA21BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCLAB2', 'FA21BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCPT1', 'FA21BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCPT2', 'FA21BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCFE', 'FA21BNWC');

INSERT Assess(AsID, ClassID) VALUES ('LABLOC', 'FA21CLAB');

INSERT Assess(AsID, ClassID) VALUES ('DBIAS', 'FA21DDBI');
INSERT Assess(AsID, ClassID) VALUES ('DBILAB1', 'FA21DDBI');;

INSERT Assess(AsID, ClassID) VALUES ('CSDAS', 'FA21ECSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDLAB1', 'FA21ECSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDLAB2', 'FA21ECSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDPT', 'FA21ECSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDPE', 'FA21ECSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDFE', 'FA21ECSD');

INSERT Assess(AsID, ClassID) VALUES ('JPDAS1', 'FA21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDAS2', 'FA21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDLAB1', 'FA21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDLAB2', 'FA21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDPT1', 'FA21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDPT2', 'FA21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDFE', 'FA21FJPD');

INSERT Assess(AsID, ClassID) VALUES ('SSGAS1', 'FA21GSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGAS2', 'FA21GSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGPT1', 'FA21GSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGPT2', 'FA21GSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGFE', 'FA21GSSG');

INSERT Assess(AsID, ClassID) VALUES ('OSGAS', 'FA21HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGLAB1', 'FA21HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGLAB2', 'FA21HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGPT', 'FA21HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGPE', 'FA21HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGFE', 'FA21HOSG');

INSERT Assess(AsID, ClassID) VALUES ('PRFAS', 'FA21HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFLAB1', 'FA21HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFLAB2', 'FA21HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFPT', 'FA21HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFPE', 'FA21HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFFE', 'FA21HPRF');

INSERT Assess(AsID, ClassID) VALUES ('CSIAS1', 'FA21ICSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIAS2', 'FA21ICSI');
INSERT Assess(AsID, ClassID) VALUES ('CSILAB1', 'FA21ICSI');
INSERT Assess(AsID, ClassID) VALUES ('CSILAB2', 'FA21ICSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIPT1', 'FA21ICSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIPT2', 'FA21ICSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIFE', 'FA21ICSI');

INSERT Assess(AsID, ClassID) VALUES ('MAEAS1', 'FA21IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEAS2', 'FA21IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAELAB1', 'FA21IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAELAB2', 'FA21IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEPT1', 'FA21IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEPT2', 'FA21IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEFE', 'FA21IMAE');

INSERT Assess(AsID, ClassID) VALUES ('SSLFE', 'FA21ISSL');

INSERT Assess(AsID, ClassID) VALUES ('MADAS1', 'FA21JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADAS2', 'FA21JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADLAB1', 'FA21JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADLAB2', 'FA21JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADPT1', 'FA21JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADPT2', 'FA21JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADFE', 'FA21JMAD');

INSERT Assess(AsID, ClassID) VALUES ('CEAAS1', 'FA21KCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAAS2', 'FA21KCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAPT1', 'FA21KCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAPT2', 'FA21KCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAFE', 'FA21KCEA');

INSERT Assess(AsID, ClassID) VALUES ('CSDAS', 'SP22ACSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDLAB1', 'SP22ACSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDLAB2', 'SP22ACSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDPT', 'SP22ACSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDPE', 'SP22ACSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDFE', 'SP22ACSD');

INSERT Assess(AsID, ClassID) VALUES ('DBIAS', 'SP22ADBI');
INSERT Assess(AsID, ClassID) VALUES ('DBILAB1', 'SP22ADBI');
INSERT Assess(AsID, ClassID) VALUES ('DBILAB2', 'SP22ADBI');
INSERT Assess(AsID, ClassID) VALUES ('DBIPT', 'SP22ADBI');
INSERT Assess(AsID, ClassID) VALUES ('DBIFE', 'SP22ADBI');

INSERT Assess(AsID, ClassID) VALUES ('PROAS', 'SP22APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROLAB1', 'SP22APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROLAB2', 'SP22APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROPT', 'SP22APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROPE', 'SP22APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROFE', 'SP22APRO')

INSERT Assess(AsID, ClassID) VALUES ('CSDAS', 'SP22BCSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDLAB1', 'SP22BCSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDLAB2', 'SP22BCSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDPT', 'SP22BCSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDPE', 'SP22BCSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDFE', 'SP22BCSD');

INSERT Assess(AsID, ClassID) VALUES ('IAOLAB1', 'SP22BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOLAB2', 'SP22BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOAS', 'SP22BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOPT1', 'SP22BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOPT2', 'SP22BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOFE', 'SP22BIAO');

INSERT Assess(AsID, ClassID) VALUES ('NWCAS', 'SP22BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCLAB1', 'SP22BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCFE', 'SP22BNWC');

INSERT Assess(AsID, ClassID) VALUES ('LABLOC', 'SP22CLAB');

INSERT Assess(AsID, ClassID) VALUES ('DBIAS', 'SP22DDBI');
INSERT Assess(AsID, ClassID) VALUES ('DBILAB1', 'SP22DDBI');
INSERT Assess(AsID, ClassID) VALUES ('DBILAB2', 'SP22DDBI');
INSERT Assess(AsID, ClassID) VALUES ('DBIPT', 'SP22DDBI');
INSERT Assess(AsID, ClassID) VALUES ('DBIFE', 'SP22DDBI');

INSERT Assess(AsID, ClassID) VALUES ('LABLOC', 'SP22DLAB');

INSERT Assess(AsID, ClassID) VALUES ('CSDAS', 'SP22ECSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDLAB1', 'SP22ECSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDLAB2', 'SP22ECSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDPT', 'SP22ECSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDPE', 'SP22ECSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDFE', 'SP22ECSD');

INSERT Assess(AsID, ClassID) VALUES ('JPDAS1', 'SP22FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDAS2', 'SP22FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDLAB1', 'SP22FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDLAB2', 'SP22FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDPT1', 'SP22FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDPT2', 'SP22FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDFE', 'SP22FJPD');

INSERT Assess(AsID, ClassID) VALUES ('SSGAS1', 'SP22FSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGAS2', 'SP22FSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGPT1', 'SP22FSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGPT2', 'SP22FSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGFE', 'SP22FSSG');

INSERT Assess(AsID, ClassID) VALUES ('JPDAS1', 'SP22GJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDAS2', 'SP22GJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDLAB1', 'SP22GJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDLAB2', 'SP22GJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDPT1', 'SP22GJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDPT2', 'SP22GJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDFE', 'SP22GJPD');

INSERT Assess(AsID, ClassID) VALUES ('SSGAS1', 'SP22GSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGAS2', 'SP22GSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGPT1', 'SP22GSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGPT2', 'SP22GSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGFE', 'SP22GSSG');

INSERT Assess(AsID, ClassID) VALUES ('CEAAS1', 'SP22HCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAAS2', 'SP22HCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAPT1', 'SP22HCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAPT2', 'SP22HCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAFE', 'SP22HCEA');

INSERT Assess(AsID, ClassID) VALUES ('OSGAS', 'SP22HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGLAB1', 'SP22HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGLAB2', 'SP22HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGPT', 'SP22HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGPE', 'SP22HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGFE', 'SP22HOSG');

INSERT Assess(AsID, ClassID) VALUES ('PRFAS', 'SP22HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFLAB1', 'SP22HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFLAB2', 'SP22HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFPT', 'SP22HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFPE', 'SP22HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFFE', 'SP22HPRF');

INSERT Assess(AsID, ClassID) VALUES ('MAEAS1', 'SP22IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEAS2', 'SP22IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEPT1', 'SP22IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEPT2', 'SP22IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEFE', 'SP22IMAE');

INSERT Assess(AsID, ClassID) VALUES ('SSLFE', 'SP22ISSL');

INSERT Assess(AsID, ClassID) VALUES ('CEAAS1', 'SP22JCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAAS2', 'SP22JCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAPT1', 'SP22JCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAPT2', 'SP22JCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAFE', 'SP22JCEA');

INSERT Assess(AsID, ClassID) VALUES ('MADAS1', 'SP22JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADAS2', 'SP22JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADLAB1', 'SP22JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADLAB2', 'SP22JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADPT1', 'SP22JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADPT2', 'SP22JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADFE', 'SP22JMAD');

INSERT Assess(AsID, ClassID) VALUES ('CSIAS1', 'SP22KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIAS2', 'SP22KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSILAB1', 'SP22KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSILAB2', 'SP22KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIPT1', 'SP22KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIPT2', 'SP22KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIFE', 'SP22KCSI');

INSERT Assess(AsID, ClassID) VALUES ('CSDAS', 'SU21ACSD');
INSERT Assess(AsID, ClassID) VALUES ('CSDFE', 'SU21ACSD');

INSERT Assess(AsID, ClassID) VALUES ('DBIAS', 'SU21ADBI');
INSERT Assess(AsID, ClassID) VALUES ('DBILAB1', 'SU21ADBI');
INSERT Assess(AsID, ClassID) VALUES ('DBILAB2', 'SU21ADBI');
INSERT Assess(AsID, ClassID) VALUES ('DBIPT', 'SU21ADBI');
INSERT Assess(AsID, ClassID) VALUES ('DBIFE', 'SU21ADBI');

INSERT Assess(AsID, ClassID) VALUES ('PROAS', 'SU21APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROLAB1', 'SU21APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROLAB2', 'SU21APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROPT', 'SU21APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROPE', 'SU21APRO')
INSERT Assess(AsID, ClassID) VALUES ('PROFE', 'SU21APRO')

INSERT Assess(AsID, ClassID) VALUES ('IAOLAB1', 'SU21BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOLAB2', 'SU21BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOPT2', 'SU21BIAO');
INSERT Assess(AsID, ClassID) VALUES ('IAOFE', 'SU21BIAO');

INSERT Assess(AsID, ClassID) VALUES ('NWCAS', 'SU21BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCLAB1', 'SU21BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCLAB2', 'SU21BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCPT1', 'SU21BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCPT2', 'SU21BNWC');
INSERT Assess(AsID, ClassID) VALUES ('NWCFE', 'SU21BNWC');

INSERT Assess(AsID, ClassID) VALUES ('LABLOC', 'SU21CLAB');

INSERT Assess(AsID, ClassID) VALUES ('JPDAS1', 'SU21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDAS2', 'SU21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDLAB1', 'SU21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDLAB2', 'SU21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDPT1', 'SU21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDPT2', 'SU21FJPD');
INSERT Assess(AsID, ClassID) VALUES ('JPDFE', 'SU21FJPD');

INSERT Assess(AsID, ClassID) VALUES ('SSGAS1', 'SU21FSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGAS2', 'SU21FSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGPT1', 'SU21FSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGPT2', 'SU21FSSG');
INSERT Assess(AsID, ClassID) VALUES ('SSGFE', 'SU21FSSG');

INSERT Assess(AsID, ClassID) VALUES ('OSGAS', 'SU21HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGLAB1', 'SU21HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGLAB2', 'SU21HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGPT', 'SU21HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGPE', 'SU21HOSG');
INSERT Assess(AsID, ClassID) VALUES ('OSGFE', 'SU21HOSG');

INSERT Assess(AsID, ClassID) VALUES ('PRFAS', 'SU21HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFLAB1', 'SU21HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFLAB2', 'SU21HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFPT', 'SU21HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFPE', 'SU21HPRF');
INSERT Assess(AsID, ClassID) VALUES ('PRFFE', 'SU21HPRF');

INSERT Assess(AsID, ClassID) VALUES ('MAEAS1', 'SU21IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEAS2', 'SU21IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEPT2', 'SU21IMAE');
INSERT Assess(AsID, ClassID) VALUES ('MAEFE', 'SU21IMAE');

INSERT Assess(AsID, ClassID) VALUES ('SSLFE', 'SU21ISSL');

INSERT Assess(AsID, ClassID) VALUES ('CEAAS1', 'SU21JCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAAS2', 'SU21JCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAPT1', 'SU21JCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAPT2', 'SU21JCEA');
INSERT Assess(AsID, ClassID) VALUES ('CEAFE', 'SU21JCEA');

INSERT Assess(AsID, ClassID) VALUES ('MADAS1', 'SU21JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADAS2', 'SU21JMAD');
INSERT Assess(AsID, ClassID) VALUES ('MADFE', 'SU21JMAD');

INSERT Assess(AsID, ClassID) VALUES ('CSIAS1', 'SU21KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIAS2', 'SU21KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSILAB1', 'SU21KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSILAB2', 'SU21KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIPT1', 'SU21KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIPT2', 'SU21KCSI');
INSERT Assess(AsID, ClassID) VALUES ('CSIFE', 'SU21KCSI');


SELECT * FROM Assess

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CEAAS1', 6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CEAAS2', 5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CEAFE', 7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CEAPT1', 8.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CEAPT2', 1.2, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSIAS1', 7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSIAS2', 9, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSIFE', 10, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSILAB1', 10, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSILAB2', 0.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSIPT1', 8, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSIPT2', 9, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDAS1', 2.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDAS2', 7.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDFE', 8.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDLAB1', 5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDLAB2', 6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDPT1', 8, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDPT2', 9, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MAEAS1', 10, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MAEAS2', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MAEFE', 2.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MAELAB1', 7.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MAELAB2', 7.8, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MAEPT1', 9.2, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MAEPT2', 5.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PRFAS', 3.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PRFFE', 8.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PRFLAB1', 4.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PRFLAB2', 7.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PRFPE', 8.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PRFPT', 8.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'SSLFE', 8.9, CAST('2021-08-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSDAS', 9.4, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSDFE', 8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSDLAB1', 7.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSDLAB2', 6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSDPE', 8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'CSDPT', 8.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'DBIAS', 9.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'DBIFE', 10, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'DBILAB1', 9.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'DBILAB2', 7.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'DBIPT', 8.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'IAOAS', 9.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'IAOFE', 5.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'IAOLAB1', 8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'IAOLAB2', 9, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'IAOPT1', 7, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'IAOPT2', 6.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDAS1', 8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDAS2', 9, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDFE', 10, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDLAB1', 8.9, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDLAB2', 9.7, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDPT1', 9.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'JPDPT2', 8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'LABLOC', 750, CAST('2022-04-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MADAS1', 7.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MADAS2', 8.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MADFE', 9.0, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MADLAB1', 9.7, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MADLAB2', 5.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MADPT1', 7.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'MADPT2', 9.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'NWCAS', 10.0, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'NWCFE', 9.0, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'NWCLAB1', 8.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'NWCLAB2', 7.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'NWCPT1', 8.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'NWCPT2', 7.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'OSGAS', 9.4, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'OSGFE', 7.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'OSGLAB1', 8.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'OSGLAB2', 6.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'OSGPE', 7.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'OSGPT', 8.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PROAS', 10.0, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PROFE', 9.0, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PROLAB1', 9.4, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PROLAB2', 7.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PROPE', 8.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00001', 'PROPT', 6.5, CAST('2021-12-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CEAAS1', 6.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CEAAS2', 7.2, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CEAFE', 8.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CEAPT1', 9.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CEAPT2', 6.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSIAS1', 7.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSIAS2', 6.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSIFE', 7.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSILAB1', 5.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSILAB2', 8.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSIPT1', 9.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSIPT2', 7.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDAS1', 8.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDAS2', 5.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDFE', 7.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDLAB1', 6.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDLAB2', 8.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDPT1', 9.8, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDPT2', 6.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MAEAS1', 5.9, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MAEAS2', 6.8, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MAEFE', 7.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MAELAB1', 6.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MAELAB2', 7.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MAEPT1', 6.8, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MAEPT2', 9.2, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PRFAS', 9.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PRFFE', 6.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PRFLAB1', 5.2, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PRFLAB2', 8.2, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PRFPE', 7.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PRFPT', 5.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'SSLFE', 9.6, CAST('2021-08-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MADAS1', 6.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MADAS2', 7.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MADFE', 6.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MADLAB1', 8.4, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MADLAB2', 7.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MADPT1', 6.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'MADPT2', 7.4, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'NWCAS', 8.4, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'NWCFE', 6.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'NWCLAB1', 7.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'NWCLAB2', 9.7, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'NWCPT1', 8.4, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'NWCPT2', 6.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'OSGAS', 7.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'OSGFE', 8.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'OSGLAB1', 6.7, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'OSGLAB2', 7.9, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'OSGPE', 6.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'OSGPT', 9.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PROAS', 8.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PROFE', 8.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PROLAB1', 6.7, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PROLAB2', 8.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PROPE', 7.9, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'PROPT', 8.5, CAST('2021-12-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSDAS', 3.7, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSDFE', 4.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSDLAB1', 3.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSDLAB2', 2.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSDPE', 3.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'CSDPT', 4.4, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'DBIAS', 5.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'DBIFE', 2.7, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'DBILAB1', 5.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'DBILAB2', 2.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'DBIPT', 4.4, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'IAOAS', 1.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'IAOFE', 3.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'IAOLAB1', 4.1, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'IAOLAB2', 8.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'IAOPT1', 2.9, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'IAOPT2', 1.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDAS1', 2.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDAS2', 4.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDFE', 5.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDLAB1', 3.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDLAB2', 5.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDPT1', 2.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'JPDPT2', 5.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00002', 'LABLOC', 120, CAST('2022-04-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CEAAS1', 9.2, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CEAAS2', 8.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CEAFE', 7.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CEAPT1', 7.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CEAPT2', 8.0, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CSIAS1', 8.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CSIAS2', 9.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CSIFE', 8.8, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDLAB1', 8.8, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDLAB2', 7.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDPT1', 8.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDPT2', 7.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MAEAS1', 9.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MAEAS2', 9.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MAEFE', 9.2, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MAELAB1', 9.1, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MAELAB2', 8.0, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MAEPT1', 8.9, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MAEPT2', 9.8, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PRFAS', 9.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PRFFE', 8.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PRFLAB1', 9.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PRFLAB2', 7.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PRFPE', 9.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PRFPT', 9.2, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'SSLFE', 9.1, CAST('2021-08-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MADAS1', 5.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MADAS2', 7.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MADFE', 7.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MADLAB1', 6.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MADLAB2', 5.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MADPT1', 3.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'MADPT2', 3.4, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'NWCAS', 2.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'NWCFE', 3.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'NWCLAB1', 3.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'NWCLAB2', 5.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'NWCPT1', 3.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'NWCPT2', 5.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'OSGAS', 4.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'OSGFE', 3.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PROFE', 5.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PROLAB1', 4.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PROLAB2', 6.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PROPE', 5.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'PROPT', 4.1, CAST('2021-12-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CSDAS', 8.7, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CSDFE', 7.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'CSDLAB1', 7.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'DBIPT', 8.4, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'IAOAS', 8.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'IAOFE', 9.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'IAOLAB1', 9.1, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'IAOLAB2', 8.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'IAOPT1', 9.9, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'IAOPT2', 9.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDAS1', 8.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDAS2', 8.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDFE', 7.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDLAB1', 7.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDLAB2', 9.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDPT1', 8.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'JPDPT2', 7.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00003', 'LABLOC', 900, CAST('2022-04-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CEAAS1', 4.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CEAAS2', 2.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CEAFE', 3.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CEAPT1', 4.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CEAPT2', 5.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CSIAS1', 6.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDAS1', 5.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDAS2', 3.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDFE', 4.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDLAB1', 4.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDLAB2', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDPT1', 6.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDPT2', 5.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MAEAS1', 6.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MAEAS2', 4.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MAEFE', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MAELAB1', 7.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MAELAB2', 4.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MAEPT1', 5.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MAEPT2', 6.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PRFAS', 3.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PRFFE', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PRFLAB1', 2.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PRFLAB2', 6.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PRFPE', 7.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PRFPT', 6.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'SSLFE', 7.5, CAST('2021-08-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MADAS1', 7.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MADAS2', 5.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MADFE', 8.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MADLAB1', 9.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'MADLAB2', 6.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'NWCPT2', 6.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'OSGAS', 7.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'OSGFE', 8.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'OSGLAB1', 9.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'OSGLAB2', 6.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'OSGPE', 6.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'OSGPT', 8.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PROAS', 7.7, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PROFE', 9.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PROLAB1', 6.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PROLAB2', 7.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PROPE', 8.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'PROPT', 7.1, CAST('2021-12-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CSDAS', 6.7, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CSDFE', 6.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CSDLAB1', 5.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CSDLAB2', 5.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CSDPE', 7.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'CSDPT', 6.4, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'IAOPT1', 6.9, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'IAOPT2', 5.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDAS1', 4.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDAS2', 5.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDFE', 7.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDLAB1', 7.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDLAB2', 7.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDPT1', 6.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'JPDPT2', 5.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00004', 'LABLOC', 800, CAST('2022-04-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CEAAS1', 4.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CEAAS2', 7.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CEAFE', 3.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CSIFE', 7.8, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CSILAB1', 6.7, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CSILAB2', 8.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CSIPT1', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CSIPT2', 4.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'JPDAS1', 5.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'JPDAS2', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'JPDFE', 8.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'MAEAS2', 6.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'MAEFE', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'MAELAB1', 7.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'MAELAB2', 4.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'MAEPT1', 5.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'MAEPT2', 6.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PRFAS', 3.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PRFFE', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PRFLAB1', 2.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PRFLAB2', 6.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PRFPE', 7.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PRFPT', 6.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'SSLFE', 7.5, CAST('2021-08-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'MADAS1', 7.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'MADAS2', 5.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'MADFE', 6.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'MADLAB1', 6.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'NWCLAB1', 9.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'NWCLAB2', 7.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'NWCPT1', 5.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'NWCPT2', 5.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'OSGAS', 7.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'OSGFE', 8.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'OSGLAB1', 5.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'OSGLAB2', 3.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'OSGPE', 4.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'OSGPT', 6.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PROAS', 5.7, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PROFE', 7.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PROLAB1', 5.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PROLAB2', 6.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PROPE', 8.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'PROPT', 7.1, CAST('2021-12-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CSDAS', 6.7, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CSDFE', 9.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CSDLAB1', 8.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'CSDLAB2', 8.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'IAOFE', 6.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'IAOLAB1', 5.1, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'IAOLAB2', 6.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'IAOPT1', 8.9, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'IAOPT2', 7.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'JPDAS1', 8.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'JPDAS2', 7.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'JPDFE', 8.9, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'JPDLAB1', 8.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'JPDLAB2', 8.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'JPDPT1', 7.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'JPDPT2', 6.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00005', 'LABLOC', 850, CAST('2022-04-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'CEAAS1', 7.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'CEAAS2', 7.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'CEAFE', 8.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'CEAPT1', 7.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'CEAPT2', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'JPDLAB2', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'JPDPT1', 7.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'JPDPT2', 8.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MAEAS1', 7.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MAEAS2', 6.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MAEFE', 6.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MAELAB1', 7.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MAELAB2', 8.3, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MAEPT1', 8.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MAEPT2', 6.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PRFAS', 7.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PRFFE', 7.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PRFLAB1', 8.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PRFLAB2', 8.5, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PRFPE', 7.4, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PRFPT', 7.6, CAST('2021-08-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'SSLFE', 7.5, CAST('2021-08-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MADAS1', 7.6, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MADAS2', 7.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MADFE', 7.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MADLAB1', 8.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MADLAB2', 8.5, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MADPT1', 8.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'MADPT2', 6.4, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PROAS', 7.7, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PROFE', 7.3, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PROLAB1', 7.8, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PROLAB2', 7.1, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PROPE', 8.2, CAST('2021-12-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'PROPT', 8.1, CAST('2021-12-01' AS date))

INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'CSDAS', 6.7, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'CSDFE', 6.5, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'CSDLAB1', 5.3, CAST('2022-04-01' AS date)))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'IAOLAB2', 6.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'IAOPT1', 5.9, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'IAOPT2', 6.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'JPDAS1', 6.8, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'JPDAS2', 5.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'JPDFE', 4.9, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'JPDLAB1', 6.2, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'JPDLAB2', 5.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'JPDPT1', 6.3, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'JPDPT2', 6.6, CAST('2022-04-01' AS date))
INSERT Grade(Mssv, AsID, Score, [Date]) VALUES ('HE00006', 'LABLOC', 450, CAST('2022-04-01' AS date))