USE [PhotoMonkey]
GO


 

IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[VideoLog]')  AND type IN ( N'U' ) )  DROP TABLE [VideoLog]
IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[Episodes]')  AND type IN ( N'U' ) )  DROP TABLE [Episodes]
IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[Customers_Productions]')  AND type IN ( N'U' ) )  DROP TABLE [Customers_Productions]
IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[Productions]')  AND type IN ( N'U' ) )  DROP TABLE [Productions]
IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[Channels]')  AND type IN ( N'U' ) )  DROP TABLE [Channels]
IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[Subscriptions]')  AND type IN ( N'U' ) )  DROP TABLE [Subscriptions]
IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[Customers]')  AND type IN ( N'U' ) )  DROP TABLE [Customers]
IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[Users]')  AND type IN ( N'U' ) )  DROP TABLE [Users] 
IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[OrderItems]')  AND type IN ( N'U' ) )  DROP TABLE [OrderItems]
IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[Orders]')  AND type IN ( N'U' ) )  DROP TABLE [Orders]


 
/****** Object:  Table [dbo].[VideoLog]    Script Date: 09/26/2011 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) unique NOT NULL,
	[Slug] [nvarchar](50) NOT NULL,
	[EpisodeNumber] [int] NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[FileSize] [int] NOT NULL,
	[Usage] [nvarchar](50) NOT NULL,
	[LogDate] [datetime] NOT NULL,
	[OrderItemID] [int] NULL,
	[BandwidthRate] [money] NOT NULL,
 CONSTRAINT [PK_VideoLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/26/2011 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[HashedPassword] [nvarchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[Token] [nvarchar](255) NULL,
	[IsBanned] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 09/26/2011 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First] [nvarchar](50) NOT NULL,
	[Last] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[HighriseID] [int] NULL,
	[StreamUntil] [datetime] NULL,
	[DownloadUntil] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Channels]    Script Date: 09/26/2011 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Slug] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Channels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 09/26/2011 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [nvarchar](255) NOT NULL,
	[ShopifyID] [int] NOT NULL,
	[ShopifyName] [nvarchar](255) NOT NULL,
	[Discount] [money] NULL,
	[CreatedAt] [datetime] NULL,
	[CancelReason] [nvarchar](255) NULL,
	[UpdatedAt] [datetime] NULL,
	[Subtotal] [nchar](10) NOT NULL,
	[Token] [nvarchar](255) NULL,
	[Total] [money] NOT NULL,
	[TaxIncluded] [bit] NULL,
	[LandingPage] [nvarchar](255) NULL,
	[ShopifyNumber] [nvarchar](255) NULL,
	[ReferringSite] [nvarchar](255) NULL,
	[Note] [nvarchar](255) NULL,
	[Gateway] [nvarchar](255) NULL,
	[FulfillmentStatus] [nvarchar](255) NULL,
	[FinancialStatus] [nvarchar](255) NULL,
	[Currency] [nvarchar](4) NULL,
	[ClosedAt] [datetime] NULL,
	[AcceptsMarketing] [bit] NULL,
	[Tax] [money] NULL,
	[ReferralID] [nvarchar](255) NULL,
	[IP] [nvarchar](255) NULL,
	[Weight] [int] NULL,
	[Email] [nvarchar](255) NOT NULL,
	[CancelledAt] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 09/26/2011 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Price] [money] NOT NULL,
	[Discount] [money] NOT NULL,
	[Quantity] [int] NULL,
	[RequiresShipping] [bit] NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Grams] [int] NULL,
	[SKU] [nvarchar](255) NOT NULL,
	[FulfillmentStatus] [nvarchar](255) NULL,
	[Vendor] [nvarchar](255) NULL,
	[FulfillmentService] [nvarchar](255) NULL,
	[OrderType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productions]    Script Date: 09/26/2011 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Slug] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Author] [nvarchar](50) NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[ReleasedOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Productions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 09/26/2011 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



 
IF EXISTS ( SELECT  * FROM    sys.objects  WHERE   object_id = OBJECT_ID(N'[dbo].[Reports_AnnualSales]')   )  DROP Procedure [Reports_AnnualSales]
/****** Object:  StoredProcedure [dbo].[Reports_AnnualSales]    Script Date: 09/26/2011 09:56:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Reports_AnnualSales]
	(
		@year int = 2011
	)
AS
SELECT        
	{ fn QUARTER(Orders.CreatedAt) } AS Quarter, 
	YEAR(Orders.CreatedAt) AS Year, 
	OrderItems.Price, 
	OrderItems.Discount, 
	OrderItems.Quantity, 
	OrderItems.OrderType, 
    OrderItems.SKU, 
	OrderItems.Vendor, 
	OrderItems.ID, 
	SUM(VideoLog.FileSize * .001) AS BandwidthInGigs, 
    SUM(VideoLog.FileSize * .001 * VideoLog.BandwidthRate) AS BandwidthCost
FROM            
	OrderItems 
		INNER JOIN
		Orders ON OrderItems.OrderID = Orders.ID 
	LEFT OUTER JOIN
		VideoLog ON OrderItems.ID = VideoLog.OrderItemID

GROUP BY 
	{ fn QUARTER(Orders.CreatedAt) }, 
	YEAR(Orders.CreatedAt), OrderItems.Price, OrderItems.Discount, OrderItems.Quantity, OrderItems.OrderType, OrderItems.SKU, 
                         OrderItems.Vendor, OrderItems.ID
HAVING YEAR(Orders.CreatedAt) = @year
	RETURN
GO
/****** Object:  Table [dbo].[Episodes]    Script Date: 09/26/2011 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Episodes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductionID] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ReleasedOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[DurationMinutes] [int] NOT NULL,
	[HDFileSize] [int] NOT NULL,
	[MobileFileSize] [int] NOT NULL,
	[TabletFileSize] [int] NOT NULL,
	[StreamFileSize] [int] NOT NULL,
 CONSTRAINT [PK_Episodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers_Productions]    Script Date: 09/26/2011 09:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers_Productions](
	[CustomerID] [int] NOT NULL,
	[ProductionID] [int] NOT NULL,
 CONSTRAINT [PK_Customers_Productions] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[ProductionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Customer_CreatedOn]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customer_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Customer_UpdatedOn]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customer_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_Episodes_Number]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Episodes] ADD  CONSTRAINT [DF_Episodes_Number]  DEFAULT ((0)) FOR [Number]
GO
/****** Object:  Default [DF_Episodes_CreatedOn]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Episodes] ADD  CONSTRAINT [DF_Episodes_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Episodes_UpdatedOn]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Episodes] ADD  CONSTRAINT [DF_Episodes_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_Episodes_DurationMinutes]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Episodes] ADD  CONSTRAINT [DF_Episodes_DurationMinutes]  DEFAULT ((0)) FOR [DurationMinutes]
GO
/****** Object:  Default [DF_Episodes_HDFileSize]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Episodes] ADD  CONSTRAINT [DF_Episodes_HDFileSize]  DEFAULT ((0)) FOR [HDFileSize]
GO
/****** Object:  Default [DF_Episodes_MobileFileSize]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Episodes] ADD  CONSTRAINT [DF_Episodes_MobileFileSize]  DEFAULT ((0)) FOR [MobileFileSize]
GO
/****** Object:  Default [DF_Episodes_TabletFileSize]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Episodes] ADD  CONSTRAINT [DF_Episodes_TabletFileSize]  DEFAULT ((0)) FOR [TabletFileSize]
GO
/****** Object:  Default [DF_Episodes_StreamFileSize]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Episodes] ADD  CONSTRAINT [DF_Episodes_StreamFileSize]  DEFAULT ((0)) FOR [StreamFileSize]
GO
/****** Object:  Default [DF_OrderItems_Discount]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[OrderItems] ADD  CONSTRAINT [DF_OrderItems_Discount]  DEFAULT ((0)) FOR [Discount]
GO
/****** Object:  Default [DF_OrderItems_OrderType]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[OrderItems] ADD  CONSTRAINT [DF_OrderItems_OrderType]  DEFAULT (N'single') FOR [OrderType]
GO
/****** Object:  Default [DF_Productions_Price]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Productions] ADD  CONSTRAINT [DF_Productions_Price]  DEFAULT ((0)) FOR [Price]
GO
/****** Object:  Default [DF_Productions_CreatedOn]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Productions] ADD  CONSTRAINT [DF_Productions_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Productions_CreatedOn1]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Productions] ADD  CONSTRAINT [DF_Productions_CreatedOn1]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_Subscription_CreatedOn]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Subscriptions] ADD  CONSTRAINT [DF_Subscription_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Subscription_UpdatedOn]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Subscriptions] ADD  CONSTRAINT [DF_Subscription_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_Users_CreatedAt]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
/****** Object:  Default [DF_Users_UpdatedAt]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
/****** Object:  Default [DF_Users_IsBanned]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsBanned]  DEFAULT ((0)) FOR [IsBanned]
GO
/****** Object:  Default [DF_VideoLog_Usage]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[VideoLog] ADD  CONSTRAINT [DF_VideoLog_Usage]  DEFAULT ('download') FOR [Usage]
GO
/****** Object:  Default [DF_VideoLog_LogDate]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[VideoLog] ADD  CONSTRAINT [DF_VideoLog_LogDate]  DEFAULT (getdate()) FOR [LogDate]
GO
/****** Object:  Default [DF_VideoLog_BandwidthRate]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[VideoLog] ADD  CONSTRAINT [DF_VideoLog_BandwidthRate]  DEFAULT ((0.30)) FOR [BandwidthRate]
GO
/****** Object:  ForeignKey [FK_Customers_Productions_Customer]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Customers_Productions]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Productions_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Customers_Productions] CHECK CONSTRAINT [FK_Customers_Productions_Customer]
GO
/****** Object:  ForeignKey [FK_Customers_Productions_Productions]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Customers_Productions]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Productions_Productions] FOREIGN KEY([ProductionID])
REFERENCES [dbo].[Productions] ([ID])
GO
ALTER TABLE [dbo].[Customers_Productions] CHECK CONSTRAINT [FK_Customers_Productions_Productions]
GO
/****** Object:  ForeignKey [FK_Episodes_Productions]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Episodes]  WITH CHECK ADD  CONSTRAINT [FK_Episodes_Productions] FOREIGN KEY([ProductionID])
REFERENCES [dbo].[Productions] ([ID])
GO
ALTER TABLE [dbo].[Episodes] CHECK CONSTRAINT [FK_Episodes_Productions]
GO
/****** Object:  ForeignKey [FK_OrderItems_Orders]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
/****** Object:  ForeignKey [FK_Productions_Channels]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Productions]  WITH CHECK ADD  CONSTRAINT [FK_Productions_Channels] FOREIGN KEY([ChannelID])
REFERENCES [dbo].[Channels] ([ID])
GO
ALTER TABLE [dbo].[Productions] CHECK CONSTRAINT [FK_Productions_Channels]
GO
/****** Object:  ForeignKey [FK_Subscription_Customer]    Script Date: 09/26/2011 09:56:52 ******/
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscription_Customer]
GO
