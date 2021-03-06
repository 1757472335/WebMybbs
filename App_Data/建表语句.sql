USE [DbMybbs]
GO
/****** Object:  Table [dbo].[admininfo]    Script Date: 2019/12/17 18:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admininfo](
	[UID] [int] NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[jurisdiction] [nchar](10) NULL,
 CONSTRAINT [PK_admininfo] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[articleinfo]    Script Date: 2019/12/17 18:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[articleinfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[classID] [int] NULL,
	[wusername] [varchar](50) NULL,
	[wtitle] [varchar](100) NULL,
	[wcontent] [nvarchar](max) NULL,
	[wpostedtime] [smalldatetime] NULL,
	[wpviews] [int] NULL,
	[wcommentsnum] [int] NULL,
	[wisFile] [nchar](1) NULL,
	[fID] [int] NULL,
 CONSTRAINT [PK_articleinfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[blogrollinfo]    Script Date: 2019/12/17 18:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogrollinfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[url] [nchar](200) NULL,
	[title] [nchar](50) NULL,
 CONSTRAINT [PK_blogrollinfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[classinfo]    Script Date: 2019/12/17 18:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classinfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[classname] [nchar](10) NULL,
 CONSTRAINT [PK_classinfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[commentinfo]    Script Date: 2019/12/17 18:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commentinfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[pusername] [nchar](16) NULL,
	[puserID] [int] NULL,
	[particleID] [int] NULL,
	[pcontent] [nvarchar](200) NULL,
	[ptime] [smalldatetime] NULL,
	[pIP] [nchar](40) NULL,
 CONSTRAINT [PK_commentinfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fileinfo]    Script Date: 2019/12/17 18:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fileinfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[articleID] [int] NULL,
	[url] [nchar](500) NULL,
	[fType] [nchar](50) NULL,
	[fUsername] [nchar](50) NULL,
 CONSTRAINT [PK_fileinfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[replyCommentinfo]    Script Date: 2019/12/17 18:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[replyCommentinfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[pusername] [nchar](16) NULL,
	[particleID] [int] NULL,
	[commentinfoID] [int] NULL,
	[pcontent] [nchar](200) NULL,
	[ptime] [smalldatetime] NULL,
	[pIP] [nchar](40) NOT NULL,
 CONSTRAINT [PK_replyComment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userinfo]    Script Date: 2019/12/17 18:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userinfo](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](16) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[jurisdiction] [varchar](50) NULL,
	[exper] [int] NULL,
 CONSTRAINT [PK_userinfo] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[articleinfo]  WITH CHECK ADD  CONSTRAINT [FK_articleinfo_classinfo] FOREIGN KEY([classID])
REFERENCES [dbo].[classinfo] ([ID])
GO
ALTER TABLE [dbo].[articleinfo] CHECK CONSTRAINT [FK_articleinfo_classinfo]
GO
ALTER TABLE [dbo].[fileinfo]  WITH CHECK ADD  CONSTRAINT [FK_fileinfo_articleinfo] FOREIGN KEY([articleID])
REFERENCES [dbo].[articleinfo] ([ID])
GO
ALTER TABLE [dbo].[fileinfo] CHECK CONSTRAINT [FK_fileinfo_articleinfo]
GO
ALTER TABLE [dbo].[replyCommentinfo]  WITH CHECK ADD  CONSTRAINT [FK_replyCommentinfo_commentinfo] FOREIGN KEY([commentinfoID])
REFERENCES [dbo].[commentinfo] ([ID])
GO
ALTER TABLE [dbo].[replyCommentinfo] CHECK CONSTRAINT [FK_replyCommentinfo_commentinfo]
GO
