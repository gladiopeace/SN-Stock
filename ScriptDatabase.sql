
CREATE TABLE [dbo].[FollowStock](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StockFollowed] [varchar](16) NULL,
	[CreatedDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FollowUser]    Script Date: 12/5/2014 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowUser](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserIdFollowed] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostComments]    Script Date: 12/5/2014 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostComments](
	[PostCommentsId] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](256) NOT NULL,
	[PostedBy] [bigint] NOT NULL,
	[CommentBy] [int] NOT NULL,
	[PostedDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PostCommentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 12/5/2014 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](256) NOT NULL,
	[PostedBy] [int] NOT NULL,
	[PostedDate] [datetime2](7) NOT NULL,
	[ChartImageURL] [nvarchar](128) NULL,
	[NhanDinh] [int] NULL,
	[Vir] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Settings]    Script Date: 12/5/2014 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](32) NULL,
	[Value] [nvarchar](128) NULL,
	[CreatedDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockCode]    Script Date: 12/5/2014 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[ShortName] [nvarchar](256) NOT NULL,
	[LongName] [nvarchar](256) NULL
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockPrice]    Script Date: 12/5/2014 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockPrice](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[CeilingPrice] [money] NULL,
	[FloorPrice] [money] NULL,
	[DiffPrice] [money] NULL,
	[OpenPrice] [money] NULL,
	[HighPrice] [money] NULL,
	[LowPrice] [money] NULL,
	[ClosePrice] [money] NULL,
	[TradingDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockRelate]    Script Date: 12/5/2014 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[StockRelate](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StockCodeRelate] [varchar](16) NULL,
	[PostId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockViewLastest]    Script Date: 12/5/2014 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockViewLastest](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StockCode] [varchar](16) NULL,
	[CreatedDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[UserRelate](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PostId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserViewLastest]    Script Date: 12/5/2014 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserViewLastest](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserIdLastest] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_Id]    Script Date: 12/5/2014 11:27:06 AM ******/

ALTER TABLE [dbo].[UserLogins] ADD  DEFAULT ((0)) FOR [AccountType]
GO



ALTER TABLE [dbo].[FollowStock]  WITH CHECK ADD  CONSTRAINT [FK_FollowStock_UserLogins] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserLogins] ([Id])
GO
ALTER TABLE [dbo].[FollowStock] CHECK CONSTRAINT [FK_FollowStock_UserLogins]
GO
ALTER TABLE [dbo].[FollowUser]  WITH CHECK ADD  CONSTRAINT [FK_FollowUser_UserLogins] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserLogins] ([Id])
GO
ALTER TABLE [dbo].[FollowUser] CHECK CONSTRAINT [FK_FollowUser_UserLogins]
GO
ALTER TABLE [dbo].[FollowUser]  WITH CHECK ADD  CONSTRAINT [FK_FollowUser_UserLogins1] FOREIGN KEY([UserIdFollowed])
REFERENCES [dbo].[UserLogins] ([Id])
GO
ALTER TABLE [dbo].[FollowUser] CHECK CONSTRAINT [FK_FollowUser_UserLogins1]
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD  CONSTRAINT [FK_PostComments_Posts] FOREIGN KEY([PostedBy])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostComments] CHECK CONSTRAINT [FK_PostComments_Posts]
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD  CONSTRAINT [FK_PostComments_UserLogins] FOREIGN KEY([CommentBy])
REFERENCES [dbo].[UserLogins] ([Id])
GO
ALTER TABLE [dbo].[PostComments] CHECK CONSTRAINT [FK_PostComments_UserLogins]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_UserLogins] FOREIGN KEY([PostedBy])
REFERENCES [dbo].[UserLogins] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_UserLogins]
GO
ALTER TABLE [dbo].[StockRelate]  WITH CHECK ADD  CONSTRAINT [FK_StockRelate_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[StockRelate] CHECK CONSTRAINT [FK_StockRelate_Posts]
GO
ALTER TABLE [dbo].[StockViewLastest]  WITH CHECK ADD  CONSTRAINT [FK_StockViewLastest_UserLogins] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserLogins] ([Id])
GO
ALTER TABLE [dbo].[StockViewLastest] CHECK CONSTRAINT [FK_StockViewLastest_UserLogins]
GO
ALTER TABLE [dbo].[UserRelate]  WITH CHECK ADD  CONSTRAINT [FK_UserRelate_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[UserRelate] CHECK CONSTRAINT [FK_UserRelate_Posts]
GO
ALTER TABLE [dbo].[UserRelate]  WITH CHECK ADD  CONSTRAINT [FK_UserRelate_UserLogins] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserLogins] ([Id])
GO
ALTER TABLE [dbo].[UserRelate] CHECK CONSTRAINT [FK_UserRelate_UserLogins]
GO
ALTER TABLE [dbo].[UserViewLastest]  WITH CHECK ADD  CONSTRAINT [FK_UserViewLastest_UserLogins] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserLogins] ([Id])
GO
ALTER TABLE [dbo].[UserViewLastest] CHECK CONSTRAINT [FK_UserViewLastest_UserLogins]
GO
ALTER TABLE [dbo].[UserViewLastest]  WITH CHECK ADD  CONSTRAINT [FK_UserViewLastest_UserLogins1] FOREIGN KEY([UserIdLastest])
REFERENCES [dbo].[UserLogins] ([Id])
GO
ALTER TABLE [dbo].[UserViewLastest] CHECK CONSTRAINT [FK_UserViewLastest_UserLogins1]
GO

ALTER TABLE dbo.StockCode
ADD [MarketType] [smallint] NULL
GO
ALTER TABLE dbo.StockCode
ADD  [IndexName] nvarchar(255) null

ALTer TABLE [dbo].[Posts]
 ALTER Column [Message] nvarchar(512)


ALTER TABLE [dbo].[Posts]
ADD StockPrimary varchar(16)

ALTER TABLE [dbo].[UserLogins]
ADD [Status] nvarchar(128)
	
	
CREATE TABLE FilterKeyWord
(
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	KeyWord nvarchar(128),
	CreateDate [datetime2](7) NULL
)

ALTER TABLE [dbo].[Posts]
ALTER COLUMN [NhanDinh] tinyint

ALTER TABLE [dbo].[Posts]
ADD ChartYN bit

  ALTER TABLE [StockRelate]
  ADD PinTab bit


CREATE TABLE [dbo].[PinStock](
	[ID] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[StockCodePin] [varchar](16) NULL,
	[PostId] [bigint] NOT NULL
	)

ALTER TABLE [dbo].[PinStock]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PinStock] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] (PostId)
GO


ALTER TABLE [dbo].[PinStock]
  ADD [CreatedDate] [datetime2](7) NOT NULL default(getdate())
  
  

  ALTER TABLE [dbo].[PinStock]
  ADD [WhoPost] [int]


Create Table NotificationMessege(
	[ID] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[UserPost] [int] NOT NULL,
	[UserReciver] [int] NOT NULL,
	[PostId] [bigint],
	NumNoti [int],
	TypeNoti varchar(1), --R: of reply, U: of @user
	CreateDate [datetime2](7) NOT NULL
)

ALTER TABLE [dbo].[NotificationMessege]  WITH CHECK ADD  CONSTRAINT [FK_UserPost_User] FOREIGN KEY([UserPost])
REFERENCES [dbo].[UserLogins] (Id)
GO

ALTER TABLE [dbo].[NotificationMessege]  WITH CHECK ADD  CONSTRAINT [FK_UserPost_UserReciver] FOREIGN KEY([UserReciver])
REFERENCES [dbo].[UserLogins] (Id)
GO

ALTER TABLE [dbo].[NotificationMessege]  WITH CHECK ADD  CONSTRAINT [FK_Posts_User] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] (PostId)
GO


  ALTER TABLE [dbo].[NotificationMessege]  
  ADD [XemYN] [bit] default(0)

ALTER TABLE [dbo].[Posts]
ALTER COLUMN [Message] nvarchar(2048)

  ALTER TABLE [StockPrice]
  ADD Totalshare float

  ALTER TABLE [UserLogins]
  add Mobile varchar(16),
  JobTitle nvarchar(256),
  URLFacebook nvarchar(256),
  CVInfo nvarchar(512)

  ALTER TABLE [UserLogins]
 add NumberExMarketYear tinyint,
 PhilosophyMarket tinyint



Alter table [dbo].[UserLogins]
alter column [JobTitle] [tinyint]

Create table JobTitile (
	IdJob tinyint identity(1,1) primary key,
	JobName nvarchar(256),
	[CreatedDate] [datetime2](7) NULL default(getdate())
)

Create table Philosophy (
	Id tinyint identity(1,1) primary key,
	PhilosophyName nvarchar(256),
	[CreatedDate] [datetime2](7) NULL default(getdate())
)

ALTER TABLE [dbo].UserLogins  WITH CHECK ADD  CONSTRAINT [FK_JobTitile_JobTitle] FOREIGN KEY(JobTitle)
REFERENCES [dbo].JobTitile (IdJob)
GO

ALTER TABLE [dbo].UserLogins  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Philosophy] FOREIGN KEY(PhilosophyMarket)
REFERENCES [dbo].Philosophy (Id)
GO

ALTER TABLE [dbo].[Posts]
ADD SumLike int default(0)

 UPDATE [dbo].[Posts] set Sumlike = 0

Create table TickerHot (
	Id int identity(1,1) primary key,
	THName varchar(16)
)

// ngay 12-03-2015
ALTER TABLE [dbo].[Posts]
ADD SumReply int not null default(0)

update [dbo].[Posts] set SumReply = 0
update [dbo].[Posts] set [SumReply] = (select count(*) from  [dbo].[PostComments] where [Posts].PostId = [PostComments].PostedBy)

//

  ALTER TABLE [PostComments]
  ALTER Column [Message] [nvarchar](1024) NOT NULL  


// ngay 13-03-2015

  ALTER TABLE [UserLogins]
  ADD BrokerVIP bit


 ALTER TABLE [dbo].[PinStock]
  ADD [CreatedDate] [datetime2](7) NOT NULL default(getdate())

ALter Table [dbo].[UserLogins]
Add CoverPosition varchar(8)

// ngay 21-04-2015

ALTER TABLE [dbo].[Posts]
ALTER COlumn [StockPrimary] varchar(512) --// cai nay chuyen qua ko mac dinh co phieu, se dc luu tat ca co phieu lien quan voi dau '|'
  
ALTER TABLE [dbo].[UserLogins]
ADD IdFacebook varchar(32)

Alter table [UserLogins]
Add AvatarSyn bit


-- date 04-01-2016
-- ngay 25-01-2016
Create Table UserLogExtent(
	[ID] bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Username nvarchar(256) NULL,
	TokenResetPass nvarchar(max) NULL,
	TimeResetExpire [datetime2](7) NOT NULL,
	IsReset bit default(0) not null
	)

-- date 12-02-2016
Alter table [dbo].[Posts]
Alter column [Message] nvarchar(max)

Alter table [dbo].[UserLogins]
add CharacterLimit int not null default(200)

-- date 21-02-2016

ALTER table [UserLogins]
Add [DisableUser] bit null

-- date 24-02-2016
Alter table [dbo].[Posts]
Add [Priority] tinyint null

-- date 15-03-2016
ALTER TABLE [dbo].[Posts]
ADD ReplyRelated varchar(2048) NULL
-- date 16-03-2016
ALTER TABLE [dbo].[Posts]
ADD ReplyRelatedUser varchar(1024) NULL

-- date 23-07-2016
-- Add skypeId column
  ALTER Table [UserLogins]
  Add SkypeId varchar(256) NULL
