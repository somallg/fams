USE [master]
GO
/****** Object:  Database [FAMS1]    Script Date: 4/16/2019 2:55:16 PM ******/
CREATE DATABASE [FAMS1]
 
GO
USE [FAMS1]
GO
/****** Object:  Schema [java1805]    Script Date: 4/16/2019 2:55:16 PM ******/
CREATE SCHEMA [java1805]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_CourseSearch]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udf_CourseSearch](
	@courseCode NVARCHAR(100),
	@courseTitle NVARCHAR(100)
)
RETURNS @temp TABLE(
	course_code VARCHAR(10) PRIMARY KEY,
	course_title NVARCHAR(100),
	duration INT,
	descriptions NVARCHAR(1000),
	[status] BIT
)
AS
BEGIN
	IF(LEN(@courseCode) = 0)
	BEGIN
		INSERT INTO @temp
		SELECT c.course_code, c.course_title, c.duration, c.descriptions, c.status
		FROM dbo.Course c
		WHERE course_title LIKE '%'+@courseTitle+'%';-- AND course_code = @courseCode
	END
	ELSE
	BEGIN
		INSERT INTO @temp
		SELECT c.course_code, c.course_title, c.duration, c.descriptions, c.status
		FROM dbo.Course c
		WHERE course_title LIKE '%'+@courseTitle+'%' AND course_code = @courseCode
	END
	
	RETURN;
END
	
GO
/****** Object:  Table [dbo].[Clazz]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clazz](
	[clazz_id] [int] IDENTITY(1,1) NOT NULL,
	[clazz_code] [varchar](20) NOT NULL,
	[clazz_name] [nvarchar](100) NULL,
	[starts_date] [date] NULL,
	[ends_date] [date] NULL,
	[descriptions] [nvarchar](1000) NULL,
	[learning_code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[clazz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[course_code] [varchar](10) NOT NULL,
	[course_title] [nvarchar](100) NULL,
	[duration] [int] NULL,
	[descriptions] [nvarchar](1000) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COURSELEARN]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COURSELEARN](
	[learning_code] [varchar](10) NOT NULL,
	[course_code] [varchar](10) NOT NULL,
	[descriptions] [nvarchar](200) NULL,
 CONSTRAINT [PK_courselearn] PRIMARY KEY CLUSTERED 
(
	[learning_code] ASC,
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enroll](
	[enroll_id] [int] IDENTITY(1,1) NOT NULL,
	[course_code] [varchar](10) NULL,
	[trn_id] [int] NULL,
	[gpa] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[enroll_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LearningPath]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LearningPath](
	[learning_code] [varchar](10) NOT NULL,
	[technic_name] [nvarchar](100) NOT NULL,
	[descriptions] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[learning_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[clazz_id] [int] NULL,
	[course_code] [varchar](10) NULL,
	[trainer_id] [int] NULL,
	[duration] [int] NULL,
	[starts_date] [date] NULL,
	[ends_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trainee]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trainee](
	[trn_id] [int] IDENTITY(1,1) NOT NULL,
	[trn_account] [varchar](50) NOT NULL,
	[trn_name] [nvarchar](100) NULL,
	[trn_email] [nvarchar](100) NULL,
	[external_email] [nvarchar](100) NULL,
	[mobile_phone] [varchar](20) NULL,
	[clazz_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[trn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trainer]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trainer](
	[trainer_id] [int] IDENTITY(1,1) NOT NULL,
	[trainer_account] [varchar](50) NOT NULL,
	[trainer_name] [nvarchar](100) NULL,
	[subjects] [nvarchar](200) NULL,
	[trainer_email] [nvarchar](100) NULL,
	[external_email] [nvarchar](100) NULL,
	[mobile_phone] [varchar](20) NULL,
	[roles] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[trainer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[enabled] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users_Roles]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users_Roles](
	[user_role_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[authority] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Clazz] ON 

GO
INSERT [dbo].[Clazz] ([clazz_id], [clazz_code], [clazz_name], [starts_date], [ends_date], [descriptions], [learning_code]) VALUES (1, N'FR_JAVA_HN1708', N'Fresher Java 08', CAST(N'2017-11-01' AS Date), CAST(N'2018-01-31' AS Date), N'Fresher Java', N'J_WEB')
GO
INSERT [dbo].[Clazz] ([clazz_id], [clazz_code], [clazz_name], [starts_date], [ends_date], [descriptions], [learning_code]) VALUES (2, N'FR_HN17_05', N'ABC', CAST(N'2017-07-01' AS Date), CAST(N'2017-10-01' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clazz] ([clazz_id], [clazz_code], [clazz_name], [starts_date], [ends_date], [descriptions], [learning_code]) VALUES (3, N'FR_HN17_09', N'Fresher Java HN 1705', CAST(N'2017-07-01' AS Date), CAST(N'2017-10-01' AS Date), NULL, NULL)
GO
INSERT [dbo].[Clazz] ([clazz_id], [clazz_code], [clazz_name], [starts_date], [ends_date], [descriptions], [learning_code]) VALUES (4, N'Fresher Ja', N'Fresher Java HN 1708', CAST(N'2018-02-15' AS Date), CAST(N'2018-02-16' AS Date), N'sa', NULL)
GO
INSERT [dbo].[Clazz] ([clazz_id], [clazz_code], [clazz_name], [starts_date], [ends_date], [descriptions], [learning_code]) VALUES (5, N'Java01', N'Java01', CAST(N'2018-02-10' AS Date), CAST(N'2018-02-25' AS Date), N'hg', NULL)
GO
INSERT [dbo].[Clazz] ([clazz_id], [clazz_code], [clazz_name], [starts_date], [ends_date], [descriptions], [learning_code]) VALUES (6, N'Java_HN_1805', N'Fresher Java 05', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clazz] ([clazz_id], [clazz_code], [clazz_name], [starts_date], [ends_date], [descriptions], [learning_code]) VALUES (7, N'Java_HN_18051', N'Fresher Java 05', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clazz] ([clazz_id], [clazz_code], [clazz_name], [starts_date], [ends_date], [descriptions], [learning_code]) VALUES (8, N'Java_HN_18052', N'Fresher Java 05', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Clazz] ([clazz_id], [clazz_code], [clazz_name], [starts_date], [ends_date], [descriptions], [learning_code]) VALUES (11, N'Java_HN_18053', N'Fresher Java 05', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Clazz] OFF
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'BTJB', N'Java Basic', 3, N'abc', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE01', N'JavaBasics 22337777777', 10, N'', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE0111', N'TTessssssss', 1, N'sa', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE0186', N'BTJB-Java', 0, N'', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE02', N'SQL Server', 5, N'', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE03', N'JDBC', 1, NULL, 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE04', N'BTNB', 1, NULL, 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE05', N'Hibernate 1221', 2, N'', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE06', N'Spring Framework', 5, NULL, 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'Course0607', N'Course New', 10, N'sa', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE07', N'ATNB', 7, NULL, 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE08', N'CnU', 3, NULL, 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'COURSE28', N'Course New', 1, N'FA', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'JAVA', N'JAVA2828282', 10, N'', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'Java03', N'JAVA', 8, N'', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'java1805', N'java1805', 2, N'java1805', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'java3333', N'sa', 1, N'', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'java5', N'BTJB-Java', 2, N'fa', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'JAVA8118', N'JAVA8118', 5, N'sâ', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'JAVAss', N'JAVA', 10, N'', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'JDBC111', N'JDBC', 2, N'sa', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'MOCKITO', N'MOCKITO', 5, N'MOCKITO', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'MOCKITO1', N'MOCKITO', 5, N'MOCKITO', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'RnD', N'Requirement and Design', 10, N'', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'sa2', N'sa', 3, N'Fresher academy', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'sa3', N'sa', 1, N'fa', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'sa6', N'sa', 2, N'fa', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'sadsdsdsdA', N'fagsdfgf', 3, N'sa', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'sasasasasa', N'sasasasasasa', 33, N'sasasasa', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'sassa', N'BTJB-Java', 5, N's', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'Tesst2001', N'Tesst 2001', 5, N'Tesst 2001', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'TEST0607', N'Test 0607', 1, N'sa', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'Test2605', N'Test 25 06', 5, N'sa', 1)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'Test2807', N'Test 28076666666', 1, N'', 0)
GO
INSERT [dbo].[Course] ([course_code], [course_title], [duration], [descriptions], [status]) VALUES (N'TestTest01', N'Test Khoa1 ', 2, N'Fa', 1)
GO
INSERT [dbo].[COURSELEARN] ([learning_code], [course_code], [descriptions]) VALUES (N'J_WEB', N'COURSE01', N'Java Web Developer')
GO
INSERT [dbo].[COURSELEARN] ([learning_code], [course_code], [descriptions]) VALUES (N'J_WEB', N'COURSE02', N'Java Web Developer')
GO
INSERT [dbo].[COURSELEARN] ([learning_code], [course_code], [descriptions]) VALUES (N'J_WEB', N'COURSE03', N'Java Web Developer')
GO
INSERT [dbo].[COURSELEARN] ([learning_code], [course_code], [descriptions]) VALUES (N'J_WEB', N'COURSE05', N'Java Web Developer')
GO
INSERT [dbo].[COURSELEARN] ([learning_code], [course_code], [descriptions]) VALUES (N'J_WEB', N'COURSE06', N'Java Web Developer')
GO
INSERT [dbo].[COURSELEARN] ([learning_code], [course_code], [descriptions]) VALUES (N'N_WEB', N'COURSE02', N'Net Web Developer')
GO
INSERT [dbo].[COURSELEARN] ([learning_code], [course_code], [descriptions]) VALUES (N'N_WEB', N'COURSE04', N'Net Web Developer')
GO
INSERT [dbo].[COURSELEARN] ([learning_code], [course_code], [descriptions]) VALUES (N'N_WEB', N'COURSE07', N'Net Web Developer')
GO
INSERT [dbo].[COURSELEARN] ([learning_code], [course_code], [descriptions]) VALUES (N'N_WEB', N'COURSE08', N'Net Web Developer')
GO
INSERT [dbo].[LearningPath] ([learning_code], [technic_name], [descriptions]) VALUES (N'C_TEC', N'C Tech', N'C Developer')
GO
INSERT [dbo].[LearningPath] ([learning_code], [technic_name], [descriptions]) VALUES (N'J_WEB', N'Java Web', N'Java Web Developer')
GO
INSERT [dbo].[LearningPath] ([learning_code], [technic_name], [descriptions]) VALUES (N'N_WEB', N'Net Web', N'Java Web Developer')
GO
SET IDENTITY_INSERT [dbo].[Trainee] ON 

GO
INSERT [dbo].[Trainee] ([trn_id], [trn_account], [trn_name], [trn_email], [external_email], [mobile_phone], [clazz_id]) VALUES (1, N'Mai', N'Mai', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Trainee] OFF
GO
SET IDENTITY_INSERT [dbo].[Trainer] ON 

GO
INSERT [dbo].[Trainer] ([trainer_id], [trainer_account], [trainer_name], [subjects], [trainer_email], [external_email], [mobile_phone], [roles]) VALUES (1, N'DieuNT1', N'Nguyễn Thị Điệu', N'Java', N'dieunt1@fsoft.com.vn', N'dieunt.it@gmail.com', N'0987859835', N'trainer')
GO
INSERT [dbo].[Trainer] ([trainer_id], [trainer_account], [trainer_name], [subjects], [trainer_email], [external_email], [mobile_phone], [roles]) VALUES (2, N'HuongVD', N'Vũ Đức Hướng', NULL, N'huongvd@fsoft.com.vn', NULL, NULL, N'admin')
GO
SET IDENTITY_INSERT [dbo].[Trainer] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [enabled]) VALUES (1, N'dieunguyen', N'dieunt1@fsoft.com.vn', N'12345', 1)
GO
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [enabled]) VALUES (2, N'dieunt1', N'dieunguyencva@gmail.com', N'sa', 1)
GO
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [enabled]) VALUES (3, N'admin', N'admin@fsoft.com', N'admin', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[Users_Roles] ([user_role_id], [user_id], [authority]) VALUES (100, 2, N'ROLE_ADMIN')
GO
INSERT [dbo].[Users_Roles] ([user_role_id], [user_id], [authority]) VALUES (101, 3, N'ROLE_ADMIN')
GO
INSERT [dbo].[Users_Roles] ([user_role_id], [user_id], [authority]) VALUES (102, 1, N'ROLE_USER')
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Clazz__3CEEF5861033A4E5]    Script Date: 4/16/2019 2:55:16 PM ******/
ALTER TABLE [dbo].[Clazz] ADD UNIQUE NONCLUSTERED 
(
	[clazz_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Trainee__AE4C12C055EB55D8]    Script Date: 4/16/2019 2:55:16 PM ******/
ALTER TABLE [dbo].[Trainee] ADD UNIQUE NONCLUSTERED 
(
	[trn_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Trainer__761F884147BEFA60]    Script Date: 4/16/2019 2:55:16 PM ******/
ALTER TABLE [dbo].[Trainer] ADD UNIQUE NONCLUSTERED 
(
	[trainer_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uni_user]    Script Date: 4/16/2019 2:55:16 PM ******/
ALTER TABLE [dbo].[Users_Roles] ADD  CONSTRAINT [uni_user] UNIQUE NONCLUSTERED 
(
	[authority] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Clazz]  WITH CHECK ADD  CONSTRAINT [FK_class_path] FOREIGN KEY([learning_code])
REFERENCES [dbo].[LearningPath] ([learning_code])
GO
ALTER TABLE [dbo].[Clazz] CHECK CONSTRAINT [FK_class_path]
GO
ALTER TABLE [dbo].[Clazz]  WITH CHECK ADD  CONSTRAINT [FK4033ye7y67bmn2a9y0y35qtob] FOREIGN KEY([learning_code])
REFERENCES [dbo].[LearningPath] ([learning_code])
GO
ALTER TABLE [dbo].[Clazz] CHECK CONSTRAINT [FK4033ye7y67bmn2a9y0y35qtob]
GO
ALTER TABLE [dbo].[COURSELEARN]  WITH CHECK ADD FOREIGN KEY([course_code])
REFERENCES [dbo].[Course] ([course_code])
GO
ALTER TABLE [dbo].[COURSELEARN]  WITH CHECK ADD FOREIGN KEY([learning_code])
REFERENCES [dbo].[LearningPath] ([learning_code])
GO
ALTER TABLE [dbo].[COURSELEARN]  WITH CHECK ADD  CONSTRAINT [FKddpa82k7gdqcbg0sxgvq1351g] FOREIGN KEY([learning_code])
REFERENCES [dbo].[LearningPath] ([learning_code])
GO
ALTER TABLE [dbo].[COURSELEARN] CHECK CONSTRAINT [FKddpa82k7gdqcbg0sxgvq1351g]
GO
ALTER TABLE [dbo].[COURSELEARN]  WITH CHECK ADD  CONSTRAINT [FKqjauw5nfsisbe0v9b0s7qa1md] FOREIGN KEY([course_code])
REFERENCES [dbo].[Course] ([course_code])
GO
ALTER TABLE [dbo].[COURSELEARN] CHECK CONSTRAINT [FKqjauw5nfsisbe0v9b0s7qa1md]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD FOREIGN KEY([course_code])
REFERENCES [dbo].[Course] ([course_code])
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD FOREIGN KEY([trn_id])
REFERENCES [dbo].[Trainee] ([trn_id])
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FKbjka9suco6swrwm8y8ekrwpwu] FOREIGN KEY([course_code])
REFERENCES [dbo].[Course] ([course_code])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FKbjka9suco6swrwm8y8ekrwpwu]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FKg2wke1eli83wjbq3i2h4j09ti] FOREIGN KEY([trn_id])
REFERENCES [dbo].[Trainee] ([trn_id])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FKg2wke1eli83wjbq3i2h4j09ti]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_course_schedule] FOREIGN KEY([course_code])
REFERENCES [dbo].[Course] ([course_code])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_course_schedule]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_schedule] FOREIGN KEY([clazz_id])
REFERENCES [dbo].[Clazz] ([clazz_id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_schedule]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_trainer_schedule] FOREIGN KEY([trainer_id])
REFERENCES [dbo].[Trainer] ([trainer_id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_trainer_schedule]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK4oej39p2uy0ytyhcnlgft4c2s] FOREIGN KEY([course_code])
REFERENCES [dbo].[Course] ([course_code])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK4oej39p2uy0ytyhcnlgft4c2s]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK7oqbgoix93t3e22de6gft2yge] FOREIGN KEY([clazz_id])
REFERENCES [dbo].[Clazz] ([clazz_id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK7oqbgoix93t3e22de6gft2yge]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FKkayxnp69x3p1aehcjcm1tuxvp] FOREIGN KEY([trainer_id])
REFERENCES [dbo].[Trainer] ([trainer_id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FKkayxnp69x3p1aehcjcm1tuxvp]
GO
ALTER TABLE [dbo].[Trainee]  WITH CHECK ADD  CONSTRAINT [FK_trn_class] FOREIGN KEY([clazz_id])
REFERENCES [dbo].[Clazz] ([clazz_id])
GO
ALTER TABLE [dbo].[Trainee] CHECK CONSTRAINT [FK_trn_class]
GO
ALTER TABLE [dbo].[Trainee]  WITH CHECK ADD  CONSTRAINT [FKrtxl0cq2q5lq9keqjf0lb3fj1] FOREIGN KEY([clazz_id])
REFERENCES [dbo].[Clazz] ([clazz_id])
GO
ALTER TABLE [dbo].[Trainee] CHECK CONSTRAINT [FKrtxl0cq2q5lq9keqjf0lb3fj1]
GO
ALTER TABLE [dbo].[Users_Roles]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Users_Roles] CHECK CONSTRAINT [fk_user]
GO
/****** Object:  StoredProcedure [dbo].[findAllClazz]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[findAllClazz]
AS
BEGIN
	SELECT * FROM dbo.Clazz
END
GO
/****** Object:  StoredProcedure [dbo].[saveClazz]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[saveClazz](
	@clazz_code VARCHAR(20),
	@clazz_name NVARCHAR(100),
	@starts_date DATE,
	@ends_date DATE,
	@descriptions NVARCHAR(100),
	@status INT OUTPUT
)
AS
BEGIN
	INSERT INTO dbo.Clazz (clazz_code, clazz_name , starts_date, ends_date, descriptions)
	VALUES(@clazz_code, @clazz_name, @starts_date, @ends_date, @descriptions);

	SET @status = @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ClazzFindAll]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ClazzFindAll]
AS
BEGIN
	SELECT c.clazz_code, c.clazz_name, c.starts_date, c.ends_date, c.descriptions
	FROM dbo.Clazz c
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findAdmin]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_findAdmin]
AS
BEGIN
	SELECT t.trainer_id, t.trainer_account, t.trainer_name
	FROM dbo.Trainer t
	WHERE t.roles LIKE 'admin';
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findAllClassAdmin]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_findAllClassAdmin]
AS
BEGIN
	SELECT * FROM dbo.Trainer T WHERE T.roles LIKE 'ADMIN';
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findAllCourse]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_findAllCourse]
AS
BEGIN
	SELECT c.course_code, c.course_title, c.duration, c.descriptions
	FROM dbo.Course c;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findTrainer]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_findTrainer]
AS
BEGIN
	SELECT t.trainer_id, t.trainer_account, t.trainer_name
	FROM dbo.Trainer t
	WHERE t.roles LIKE 'trainer';
END
GO
/****** Object:  StoredProcedure [dbo].[usp_searchPagingCourse]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_searchPagingCourse](
	@PageSize INT,
	@PageNumber INT,
	@courseCode NVARCHAR(100),
	@courseTitle NVARCHAR(100)
)
AS
BEGIN
	--;WITH cte_searchCourse
	--AS
	--(
	--	SELECT c.course_code, c.course_title, c.duration, c.descriptions, c.status
	--	FROM dbo.Course c
	--	WHERE course_title LIKE '%'+@courseTitle+'%' AND course_code = @courseCode
	--)

	SELECT udf.*
	FROM udf_CourseSearch(@courseCode, @courseTitle) udf
	ORDER BY course_code OFFSET @PageSize * (@PageNumber - 1) ROWS
	FETCH NEXT @PageSize ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UserLogin]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_UserLogin](
	@user_name VARCHAR(50),
	@password VARCHAR(50)
)
AS
BEGIN
	SELECT * FROM dbo.Users WHERE [user_name] = @user_name AND password = @password;

END
GO
/****** Object:  StoredProcedure [java1805].[usp_ClazzFindByPage]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [java1805].[usp_ClazzFindByPage](
	@page INT,
	@pageSize INT,
	@seach NVARCHAR(50)
)
AS
BEGIN
	;WITH cte_ClazzWithPage
	AS
	(
		SELECT c.clazz_code, c.clazz_name,  c.starts_date, c.ends_date, c.descriptions, 
		ROW_NUMBER() OVER(ORDER BY c.clazz_id) AS [index]
		FROM dbo.Clazz c
	)
	SELECT * 
	FROM cte_ClazzWithPage
	WHERE [index] >= @pageSize * (@page -1) + 1 AND [index] <= @pageSize * @page
		AND clazz_name LIKE '%'+@seach+'%'

END
GO
/****** Object:  StoredProcedure [java1805].[usp_JobsSave]    Script Date: 4/16/2019 2:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [java1805].[usp_JobsSave](
	@job_id		VARCHAR(10), -- Linning up
	@job_title	NVARCHAR(100),
	@min_salary NUMERIC(10,2),
	@max_salary NUMERIC(10,2),
	@status		NVARCHAR(100)
)
AS
BEGIN
	INSERT INTO dbo.Jobs
	VALUES (@job_id, @job_title, @min_salary, @max_salary);
END
GO
USE [master]
GO
ALTER DATABASE [FAMS1] SET  READ_WRITE 
GO
