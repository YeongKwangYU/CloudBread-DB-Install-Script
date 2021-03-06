/**
/* Copyright https://github.com/CloudBreadProject */

* @file install-with-sample.sql
* @brief CloudBreadDB create and insert sample data script \n
* @author Dae Woo Kim
*/

/*
drop table AdminMembers
drop table Coupon
drop table CouponMember
drop table GameEventMember
drop table GameEvents
drop table GiftDepositories
drop table ItemLists
drop table MemberAccountBlockLog
drop table MemberGameInfoes
drop table MemberGameInfoStages
drop table MemberItemPurchases
drop table MemberItems
drop table Members
drop table Notices
drop table ServerInfo
drop table StatsData
drop table CloudBreadAdminLog
drop table CloudBreadErrorLog
drop table CloudBreadLog
drop table Sessions
drop proc sspBatchDARPU
drop proc sspBatchDAU
drop proc sspBatchHAU
drop proc uspComInsMemberItemPurchase
drop proc uspAddMemberItemPurchase
drop proc uspAddUseMemberItem
drop proc uspComSelCoupon
drop proc uspComSelCouponMember
drop proc uspComSelGameEventMember
drop proc uspComSelGameEvents
drop proc uspComSelGiftDepository
drop proc uspComSelItemList1
drop proc uspComSelMember
drop proc uspComSelMemberGameInfoes
drop proc uspComSelMemberGameInfoStages
drop proc uspComSelMemberItem
drop proc uspComSelMemberItemPurchase
drop proc uspComSelNotices
drop proc uspComUdtGiftDepository
drop proc uspComUdtItemList1
drop proc uspComUdtMember
drop proc uspComUdtMemberGameInfoes
drop proc uspComUdtMemberGameInfoStages
drop proc uspComUdtMemberItem
drop proc uspComUdtMemberItemPurchase
drop proc uspInsAnonymousRegMember
drop proc uspInsRegMember
drop proc uspSelAdminLogin
drop proc uspSelAdminLogout
--drop proc uspSelCoupons
drop proc uspSelGameEvents
drop proc uspSelGiftItemToMe
drop proc uspSelItem1
drop proc uspSelItemListAll
drop proc uspSelLoginIDDupeCheck
drop proc uspSelLoginInfo
drop proc uspSelMemberGameInfoStages
drop proc uspSelMemberItems
drop proc uspSelNotices
drop proc uspSelSendEmailToMember
drop proc uspUdtConfirmedEmailAddress
drop proc uspUdtCouponMember
drop proc uspUdtGameEventMemberToItem
drop proc uspUdtLoginInfo
drop proc uspUdtMemberGameInfoStage
drop proc uspUdtMoveGift
drop proc uspUdtReturnItem
drop proc uspUdtSellItem
drop proc uspUdtSendGift
drop proc uspComInsMemberGameInfoStages	--added in v2.1.0
drop proc uspComInsMemberItem	--added in v2.1.0

*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AdminMembers](
	[AdminMemberID] [nvarchar](128) NOT NULL,
	[AdminMemberPWD] [nvarchar](128) NOT NULL DEFAULT (''),
	[AdminMemberEmail] [nvarchar](256) NOT NULL DEFAULT (''),
	[IDCreateAdminMember] [nvarchar](128) NOT NULL DEFAULT (''),
	[AdminGroup] [nvarchar](40) NOT NULL DEFAULT (''),
	[TimeZoneID] [nvarchar](40) NOT NULL DEFAULT ('Korea Standard Time'),
	[PINumber] [nvarchar](50) NOT NULL DEFAULT (''),
	[Name1] [nvarchar](50) NOT NULL DEFAULT (''),
	[Name2] [nvarchar](50) NOT NULL DEFAULT (''),
	[Name3] [nvarchar](50) NOT NULL DEFAULT (''),
	[DOB] [nvarchar](16) NOT NULL DEFAULT (''),
	[LastIPaddress] [nvarchar](32) NOT NULL DEFAULT (''),
	[LastLoginDT] [nvarchar](32) NOT NULL DEFAULT (''),
	[LastLogoutDT] [nvarchar](32) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.AdminMembers] PRIMARY KEY NONCLUSTERED 
(
	[AdminMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_AdminMembers_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_AdminMembers_CreatedAt] ON [AdminMembers]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Coupon]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Coupon](
	[CouponID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[CouponCategory1] [nvarchar](50) NOT NULL DEFAULT (''),
	[CouponCategory2] [nvarchar](50) NOT NULL DEFAULT (''),
	[CouponCategory3] [nvarchar](50) NOT NULL DEFAULT (''),
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (''),
	[ItemCount] [nvarchar](50) NOT NULL DEFAULT (''),
	[ItemStatus] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetGroup] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetOS] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetDevice] [nvarchar](80) NOT NULL DEFAULT (''),
	[Title] [nvarchar](100) NOT NULL DEFAULT (''),
	[Content] [nvarchar](4000) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[DupeYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[OrderNumber] [int] NOT NULL DEFAULT ((0)),
	[CouponDurationFrom] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[CouponDurationTo] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[CreateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),		-- updated default value in https://github.com/CloudBreadProject/CloudBread/issues/33
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.[Coupon] PRIMARY KEY NONCLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_Coupon]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_Coupon] ON [Coupon]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [CouponMember]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CouponMember](
	[CouponMemberID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[CouponID] [nvarchar](128) NOT NULL DEFAULT (''),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.[CouponMember] PRIMARY KEY NONCLUSTERED 
(
	[CouponMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_CouponMember_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_CouponMember_CreatedAt] ON [CouponMember]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [GameEventMember]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GameEventMember](
	[GameEventMemberID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[eventID] [nvarchar](128) NOT NULL DEFAULT (''),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.GameEventMember] PRIMARY KEY NONCLUSTERED 
(
	[GameEventMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_GameEventMember_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_GameEventMember_CreatedAt] ON [GameEventMember]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [GameEvents]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GameEvents](
	[GameEventID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[EventCategory1] [nvarchar](50) NOT NULL DEFAULT (''),
	[EventCategory2] [nvarchar](50) NOT NULL DEFAULT (''),
	[EventCategory3] [nvarchar](50) NOT NULL DEFAULT (''),
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (''),
	[ItemCount] [nvarchar](50) NOT NULL DEFAULT (''),
	[Itemstatus] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetGroup] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetOS] [nvarchar](40) NOT NULL DEFAULT (''),
	[TargetDevice] [nvarchar](80) NOT NULL DEFAULT (''),
	[EventImageLink] [nvarchar](512) NOT NULL DEFAULT (''),
	[Title] [nvarchar](100) NOT NULL DEFAULT (''),
	[Content] [nvarchar](4000) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[EventDurationFrom] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[EventDurationTo] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[OrderNumber] [int] NOT NULL DEFAULT ((0)),
	[CreateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_GameEvents] PRIMARY KEY NONCLUSTERED 
(
	[GameEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_GameEvents_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_GameEvents_CreatedAt] ON [GameEvents]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [GiftDepositories]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GiftDepositories](
	[GiftDepositoryID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (''),
	[ItemCount] [nvarchar](40) NOT NULL DEFAULT (''),
	[FromMemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[ToMemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[SentMemberYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.GiftDepositories] PRIMARY KEY NONCLUSTERED 
(
	[GiftDepositoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_GiftDepositories_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_GiftDepositories_CreatedAt] ON [GiftDepositories]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [ItemLists]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ItemLists](
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[ItemName] [nvarchar](120) NOT NULL DEFAULT (''),
	[ItemDescription] [nvarchar](4000) NOT NULL DEFAULT (''),
	[ItemPrice] [nvarchar](50) NOT NULL DEFAULT (''),
	[ItemSellPrice] [nvarchar](50) NOT NULL DEFAULT (''),
	[ItemCategory1] [nvarchar](100) NOT NULL DEFAULT (''),
	[ItemCategory2] [nvarchar](100) NOT NULL DEFAULT (''),
	[ItemCategory3] [nvarchar](100) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[IteamCreateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[IteamUpdateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.ItemLists] PRIMARY KEY NONCLUSTERED 
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_ItemLists_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_ItemLists_CreatedAt] ON [ItemLists]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [MemberAccountBlockLog]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MemberAccountBlockLog](
	[MemberAccountBlockID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[MemberAccountBlockReasonCategory1] [nvarchar](50) NOT NULL DEFAULT (''),
	[MemberAccountBlockReasonCategory2] [nvarchar](50) NOT NULL DEFAULT (''),
	[MemberAccountBlockReasonCategory3] [nvarchar](50) NOT NULL DEFAULT (''),
	[MemberAccountBlockReason] [nvarchar](1000) NOT NULL DEFAULT (''),
	[MemberAccountBlockProcess] [nvarchar](50) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[CreateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.[MemberAccountBlockLog] PRIMARY KEY NONCLUSTERED 
(
	[MemberAccountBlockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_MemberAccountBlockLog_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_MemberAccountBlockLog_CreatedAt] ON [MemberAccountBlockLog]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [MemberGameInfoes]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MemberGameInfoes](
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[Level] [nvarchar](40) NOT NULL DEFAULT (''),
	[Exps] [nvarchar](50) NOT NULL DEFAULT (''),
	[Points] [nvarchar](50) NOT NULL DEFAULT (''),
	[UserSTAT1] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT2] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT3] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT4] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT5] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT6] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT7] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT8] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT9] [nvarchar](max) NOT NULL DEFAULT (''),
	[UserSTAT10] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.MemberGameInfoes] PRIMARY KEY NONCLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_MemberGameInfoes_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_MemberGameInfoes_CreatedAt] ON [MemberGameInfoes]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [MemberGameInfoStages]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MemberGameInfoStages](
	[MemberGameInfoStageID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[StageName] [nvarchar](100) NOT NULL DEFAULT (''),
	[StageStatus] [nvarchar](40) NOT NULL DEFAULT (''),
	[Category1] [nvarchar](80) NOT NULL DEFAULT (''),
	[Category2] [nvarchar](80) NOT NULL DEFAULT (''),
	[Category3] [nvarchar](80) NOT NULL DEFAULT (''),
	[Mission1] [nvarchar](80) NOT NULL DEFAULT (''),
	[Mission2] [nvarchar](80) NOT NULL DEFAULT (''),
	[Mission3] [nvarchar](80) NOT NULL DEFAULT (''),
	[Mission4] [nvarchar](80) NOT NULL DEFAULT (''),
	[Mission5] [nvarchar](80) NOT NULL DEFAULT (''),
	[Points] [nvarchar](50) NOT NULL DEFAULT (''),
	[StageStat1] [nvarchar](max) NOT NULL DEFAULT (''),
	[StageStat2] [nvarchar](max) NOT NULL DEFAULT (''),
	[StageStat3] [nvarchar](max) NOT NULL DEFAULT (''),
	[StageStat4] [nvarchar](max) NOT NULL DEFAULT (''),
	[StageStat5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](max) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](max) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.[MemberGameInfoStages] PRIMARY KEY NONCLUSTERED 
(
	[MemberGameInfoStageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_MemberGameInfoStages]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_MemberGameInfoStages] ON [MemberGameInfoStages]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [MemberItemPurchases]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MemberItemPurchases](
	[MemberItemPurchaseID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (''),
	[PurchaseQuantity] [nvarchar](128) NOT NULL DEFAULT (''),
	[PurchasePrice] [nvarchar](50) NOT NULL DEFAULT (''),
	[PGinfo1] [nvarchar](512) NOT NULL DEFAULT (''),
	[PGinfo2] [nvarchar](512) NOT NULL DEFAULT (''),
	[PGinfo3] [nvarchar](512) NOT NULL DEFAULT (''),
	[PGinfo4] [nvarchar](512) NOT NULL DEFAULT (''),
	[PGinfo5] [nvarchar](512) NOT NULL DEFAULT (''),
	[PurchaseDeviceID] [nvarchar](128) NOT NULL DEFAULT (''),
	[PurchaseDeviceIPAddress] [nvarchar](64) NOT NULL DEFAULT (''),
	[PurchaseDeviceMACAddress] [nvarchar](128) NOT NULL DEFAULT (''),
	[PurchaseDT] [nvarchar](64) NOT NULL DEFAULT (''),
	[PurchaseCancelYN] [nvarchar](40) NOT NULL DEFAULT (''),
	[PurchaseCancelDT] [nvarchar](64) NOT NULL DEFAULT (''),
	[PurchaseCancelingStatus] [nvarchar](40) NOT NULL DEFAULT (''),
	[PurchaseCancelReturnedAmount] [nvarchar](50) NOT NULL DEFAULT (''),
	[PurchaseCancelDeviceID] [nvarchar](128) NOT NULL DEFAULT (''),
	[PurchaseCancelDeviceIPAddress] [nvarchar](64) NOT NULL DEFAULT (''),
	[PurchaseCancelDeviceMACAddress] [nvarchar](128) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[PurchaseCancelConfirmAdminMemberID] [nvarchar](128) NOT NULL DEFAULT (''),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.MemberItemPruchases] PRIMARY KEY NONCLUSTERED 
(
	[MemberItemPurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_MemberItemPruchases_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_MemberItemPruchases_CreatedAt] ON [MemberItemPurchases]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [MemberItems]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MemberItems](
	[MemberItemID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (''),
	[ItemListID] [nvarchar](128) NOT NULL DEFAULT (''),
	[ItemCount] [nvarchar](40) NOT NULL DEFAULT (''),
	[ItemStatus] [nvarchar](50) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL CONSTRAINT [DF__MemberIte__HideY__7BE56230]  DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL CONSTRAINT [DF__MemberIte__Delet__7CD98669]  DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.MemberItems] PRIMARY KEY NONCLUSTERED 
(
	[MemberItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_MemberItems_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_MemberItems_CreatedAt] ON [MemberItems]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Members]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Members](
	[MemberID] [nvarchar](256) NOT NULL DEFAULT (newid()),
	[MemberPWD] [nvarchar](256) NOT NULL DEFAULT (''),
	[EmailAddress] [nvarchar](450) NOT NULL DEFAULT (''),
	[EmailConfirmedYN] [nvarchar](40) NOT NULL DEFAULT (''),
	[PhoneNumber1] [nvarchar](50) NOT NULL DEFAULT (''),
	[PhoneNumber2] [nvarchar](50) NOT NULL DEFAULT (''),
	[PINumber] [nvarchar](100) NOT NULL DEFAULT (''),
	[Name1] [nvarchar](100) NOT NULL DEFAULT (''),
	[Name2] [nvarchar](100) NOT NULL DEFAULT (''),
	[Name3] [nvarchar](100) NOT NULL DEFAULT (''),
	[DOB] [nvarchar](50) NOT NULL DEFAULT (''),
	[RecommenderID] [nvarchar](256) NOT NULL DEFAULT (''),
	[MemberGroup] [nvarchar](50) NOT NULL DEFAULT (''),
	[LastDeviceID] [nvarchar](128) NOT NULL DEFAULT (''),
	[LastIPaddress] [nvarchar](128) NOT NULL DEFAULT (''),
	[LastLoginDT] [nvarchar](64) NOT NULL DEFAULT (''),
	[LastLogoutDT] [nvarchar](64) NOT NULL DEFAULT (''),
	[LastMACAddress] [nvarchar](128) NOT NULL DEFAULT (''),
	[AccountBlockYN] [nvarchar](40) NOT NULL DEFAULT (''),
	[AccountBlockEndDT] [nvarchar](64) NOT NULL DEFAULT (''),
	[AnonymousYN] [nvarchar](40) NOT NULL DEFAULT (''),
	[3rdAuthProvider] [nvarchar](128) NOT NULL DEFAULT (''),
	[3rdAuthID] [nvarchar](256) NOT NULL DEFAULT (''),
	[3rdAuthParam] [nvarchar](256) NOT NULL DEFAULT (''),
	[PushNotificationID] [nvarchar](450) NOT NULL DEFAULT (''),
	[PushNotificationProvider] [nvarchar](256) NOT NULL DEFAULT (''),
	[PushNotificationGroup] [nvarchar](256) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[TimeZoneID] [nvarchar](30) NOT NULL DEFAULT ('Korea Standard Time'),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.Members] PRIMARY KEY NONCLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_Members_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_Members_CreatedAt] ON [Members]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Notices]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Notices](
	[NoticeID] [nvarchar](128) NOT NULL DEFAULT (newid()),
	[NoticeCategory1] [nvarchar](50) NOT NULL DEFAULT (''),
	[NoticeCategory2] [nvarchar](50) NOT NULL DEFAULT (''),
	[NoticeCategory3] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetGroup] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetOS] [nvarchar](50) NOT NULL DEFAULT (''),
	[TargetDevice] [nvarchar](80) NOT NULL DEFAULT (''),
	[NoticeImageLink] [nvarchar](512) NOT NULL DEFAULT (''),
	[title] [nvarchar](100) NOT NULL DEFAULT (''),
	[content] [nvarchar](4000) NOT NULL DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol6] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol7] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol8] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol9] [nvarchar](max) NOT NULL DEFAULT (''),
	[sCol10] [nvarchar](max) NOT NULL DEFAULT (''),
	[NoticeDurationFrom] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[NoticeDurationTo] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[OrderNumber] [int] NOT NULL DEFAULT ((0)),
	[CreateAdminID] [nvarchar](128) NOT NULL DEFAULT (''),
	[HideYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[DeleteYN] [nvarchar](1) NOT NULL DEFAULT ('N'),
	[CreatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_CloudBread.[Notices] PRIMARY KEY NONCLUSTERED 
(
	[NoticeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_Notices]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_Notices] ON [Notices]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [ServerInfo]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ServerInfo](
	[InfoID] [nvarchar](128) NOT NULL CONSTRAINT [DF_ServerInfo_InfoID]  DEFAULT (newid()),
	[FEServerLists] [nvarchar](4000) NOT NULL CONSTRAINT [DF_ServerInfo_FEServerLists]  DEFAULT (''),
	[SocketServerLists] [nvarchar](4000) NOT NULL CONSTRAINT [DF_ServerInfo_SocketServerLists]  DEFAULT (''),
	[Version] [nvarchar](50) NOT NULL CONSTRAINT [DF_ServerInfo_Version]  DEFAULT (''),
	[ResourceLink] [nvarchar](4000) NOT NULL CONSTRAINT [DF_ServerInfo_ResourceLink]  DEFAULT (''),
	[EULAText] [nvarchar](4000) NOT NULL CONSTRAINT [DF_ServerInfo_EULAText]  DEFAULT (''),
	[sCol1] [nvarchar](max) NOT NULL CONSTRAINT [DF_ServerInfo_sCol1]  DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL CONSTRAINT [DF_ServerInfo_sCol2]  DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL CONSTRAINT [DF_ServerInfo_sCol3]  DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL CONSTRAINT [DF_ServerInfo_sCol4]  DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL CONSTRAINT [DF_ServerInfo_sCol5]  DEFAULT (''),
	[CreatedAt] [datetimeoffset](7) NOT NULL CONSTRAINT [DF_ServerInfo_CreatedAt]  DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL CONSTRAINT [DF_ServerInfo_UpdatedAt]  DEFAULT (sysutcdatetime()),
	[DataFromRegion] [nvarchar](64) NOT NULL CONSTRAINT [DF_ServerInfo_DataFromRegion]  DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL CONSTRAINT [DF_ServerInfo_DataFromRegionDT]  DEFAULT (''),
 CONSTRAINT [PK_ServerInfo] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [StatsData]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StatsData](
	[StatID] [nvarchar](50) NOT NULL CONSTRAINT [DF_StatsData_StatID]  DEFAULT (newid()),
	[CategoryName] [nvarchar](256) NOT NULL CONSTRAINT [DF_Table_1_Group]  DEFAULT (''),
	[CountNum] [money] NOT NULL CONSTRAINT [DF_Table_1_Count]  DEFAULT ((0)),
	[Fields] [nvarchar](100) NOT NULL CONSTRAINT [DF_StatsData_Fileds]  DEFAULT (''),
	[Groups] [nvarchar](100) NOT NULL CONSTRAINT [DF_StatsGroups_Fileds]  DEFAULT (''),
	[CreatedAt] [datetimeoffset](7) NOT NULL CONSTRAINT [DF_StatsData_CreatedAt]  DEFAULT (sysutcdatetime()),
	[UpdatedAt] [datetimeoffset](7) NOT NULL CONSTRAINT [DF_StatsData_UpdatedAt]  DEFAULT (sysutcdatetime()),
	[sCol1] [nvarchar](max) NOT NULL CONSTRAINT [DF_StatsData_sCol1]  DEFAULT (''),
	[sCol2] [nvarchar](max) NOT NULL CONSTRAINT [DF_StatsData_sCol2]  DEFAULT (''),
	[sCol3] [nvarchar](max) NOT NULL CONSTRAINT [DF_StatsData_sCol3]  DEFAULT (''),
	[sCol4] [nvarchar](max) NOT NULL CONSTRAINT [DF_StatsData_sCol4]  DEFAULT (''),
	[sCol5] [nvarchar](max) NOT NULL CONSTRAINT [DF_StatsData_sCol5]  DEFAULT (''),
	[DataFromRegionDT] [datetimeoffset](7) NOT NULL DEFAULT (''),
	[DataFromRegion] [nvarchar](64) NOT NULL DEFAULT (''),
PRIMARY KEY NONCLUSTERED 
(
	[StatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_StatsData_CategoryName]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE CLUSTERED INDEX [IX_StatsData_CategoryName] ON [StatsData]
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CloudBreadAdminLog]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CloudBreadAdminLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [varchar](256) NOT NULL,
	[JobID] [varchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](2000) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CloudBreadErrorLog]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CloudBreadErrorLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [varchar](256) NOT NULL,
	[JobID] [varchar](100) NOT NULL,
	[Date] [datetime] NOT NULL DEFAULT (sysutcdatetime()),
	[Thread] [varchar](2000) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CloudBreadLog]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CloudBreadLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [varchar](256) NOT NULL,
	[JobID] [varchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](2000) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 2016-02-21 PM 5:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionId] [nvarchar](88) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Expires] [datetime] NOT NULL,
	[LockDate] [datetime] NOT NULL,
	[LockCookie] [int] NOT NULL,
	[Locked] [bit] NOT NULL,
	[SessionItem] [image] NULL,
	[Flags] [int] NOT NULL,
	[Timeout] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Index [IX_AdminMembers_AdminMemberEmail]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AdminMembers_AdminMemberEmail] ON [AdminMembers]
(
	[AdminMemberEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AdminMembers_Name1]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_AdminMembers_Name1] ON [AdminMembers]
(
	[Name1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Coupon_CouponDurationFrom]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_Coupon_CouponDurationFrom] ON [Coupon]
(
	[CouponDurationFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_Coupon_CouponCategory1]    Script Date: 2016-03-28 PM 11:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_Coupon_CouponCategory1] ON [dbo].[Coupon]		-- added in CloudBread 2.1.0
(
	[CouponCategory1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


/****** Object:  Index [IX_Coupon_CouponDurationTo]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_Coupon_CouponDurationTo] ON [Coupon]
(
	[CouponDurationTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Coupon_ItemListID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_Coupon_ItemListID] ON [Coupon]
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CouponMember_CouponID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_CouponMember_CouponID] ON [CouponMember]
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CouponMember_MemberID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_CouponMember_MemberID] ON [CouponMember]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GameEventMember_eventID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_GameEventMember_eventID] ON [GameEventMember]
(
	[eventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GameEventMember_MemberID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_GameEventMember_MemberID] ON [GameEventMember]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GameEvents_EventDurationFrom]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_GameEvents_EventDurationFrom] ON [GameEvents]
(
	[EventDurationFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GameEvents_EventDurationTo]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_GameEvents_EventDurationTo] ON [GameEvents]
(
	[EventDurationTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GameEvents_ItemListID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_GameEvents_ItemListID] ON [GameEvents]
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GiftDepositories_FromMemberID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_GiftDepositories_FromMemberID] ON [GiftDepositories]
(
	[FromMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GiftDepositories_ItemListID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_GiftDepositories_ItemListID] ON [GiftDepositories]
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GiftDepositories_ToMemberID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_GiftDepositories_ToMemberID] ON [GiftDepositories]
(
	[ToMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ItemLists_ItemCategory1]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_ItemLists_ItemCategory1] ON [ItemLists]
(
	[ItemCategory1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ItemLists_ItemCategory2]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_ItemLists_ItemCategory2] ON [ItemLists]
(
	[ItemCategory2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ItemLists_ItemCategory3]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_ItemLists_ItemCategory3] ON [ItemLists]
(
	[ItemCategory3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ItemLists_ItemName]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_ItemLists_ItemName] ON [ItemLists]
(
	[ItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberAccountBlockLog_CreateAdminID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_MemberAccountBlockLog_CreateAdminID] ON [MemberAccountBlockLog]
(
	[CreateAdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberAccountBlockLog_MemberID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_MemberAccountBlockLog_MemberID] ON [MemberAccountBlockLog]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberGameInfoStages_MemberID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_MemberGameInfoStages_MemberID] ON [MemberGameInfoStages]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItemPruchases_ItemListID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItemPruchases_ItemListID] ON [MemberItemPurchases]
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItemPruchases_MemberID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItemPruchases_MemberID] ON [MemberItemPurchases]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItemPruchases_PurchaseCancelDeviceID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItemPruchases_PurchaseCancelDeviceID] ON [MemberItemPurchases]
(
	[PurchaseCancelDeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItemPruchases_PurchaseDeviceID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItemPruchases_PurchaseDeviceID] ON [MemberItemPurchases]
(
	[PurchaseDeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItems_ItemListID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItems_ItemListID] ON [MemberItems]
(
	[ItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MemberItems_MemberID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_MemberItems_MemberID] ON [MemberItems]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Members_3rdAuthID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_Members_3rdAuthID] ON [Members]
(
	[3rdAuthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Members_EmailAddress]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Members_EmailAddress] ON [Members]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Members_LastDeviceID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_Members_LastDeviceID] ON [Members]
(
	[LastDeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Members_Name1]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_Members_Name1] ON [Members]
(
	[Name1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Members_PushNotificationID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_Members_PushNotificationID] ON [Members]
(
	[PushNotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Notices_CreateAdminID]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_Notices_CreateAdminID] ON [Notices]
(
	[CreateAdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StatsData_CreatedAt]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_StatsData_CreatedAt] ON [StatsData]
(
	[CreatedAt] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sessions_Expires]    Script Date: 2016-02-21 PM 5:28:52 ******/
CREATE NONCLUSTERED INDEX [IX_Sessions_Expires] ON [dbo].[Sessions]
(
	[Expires] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CloudBreadAdminLog] ADD  DEFAULT (sysutcdatetime()) FOR [Date]
GO
ALTER TABLE [dbo].[CloudBreadLog] ADD  DEFAULT (sysutcdatetime()) FOR [Date]
GO


/*
Install Sample data
*/


/*
truncate table StatsData
truncate table CloudBreadAdminLog
truncate table CloudBreadErrorLog
truncate table CloudBreadLog
truncate table MemberItems
truncate table MemberAccountBlockLog
truncate table Sessions
truncate table CouponMember
truncate table Members
truncate table MemberGameInfoes
truncate table GameEventMember
truncate table GameEvents
truncate table MemberGameInfoStages
truncate table Notices
truncate table AdminMembers
truncate table GiftDepositories
truncate table MemberItemPurchases
truncate table ServerInfo
truncate table Coupon
truncate table ItemLists


-- encryption CLR
-- only support on SQL Server
EXEC dbo.sp_configure 'clr enabled',1 
RECONFIGURE WITH OVERRIDE
GO

create assembly SQLServerEncryption from 'c:\SQLDLL\SQLCLRCrypt.dll' WITH PERMISSION_SET = SAFE
CREATE FUNCTION [dbo].[ENCRYPT](@plaintext [nvarchar](1000))
RETURNS [nvarchar](2000) WITH EXECUTE AS CALLER
AS
EXTERNAL NAME SQLServerEncryption.[SQLCLRCrypt.SQLCrypt].Enc
GO

select dbo.ENCRYPT('1')
m4R0rUAW4REnW0XPhHfDCw==
*/

/*
--generate column data for queuy syntax
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'


--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'


--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'


--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'


--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'


--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
*/



----------------------------------------------------------------------------------------------------------------
-- insert script start 
----------------------------------------------------------------------------------------------------------------
set nocount on

--Insert Members 
--truncate table Members 
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
INSERT INTO Members (MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('aaa', 'MemberPWD', 'aaa@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'aaa', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'LastMACAddress', 'N', '1900-01-01', 'N', '3rdAuthProvider', '3rdAuthIDaaa', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 'N', 'N', '', '', '', '')
INSERT INTO Members (MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('bbb', 'MemberPWD', 'bbb@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'bbb', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'LastMACAddress', 'N', '1900-01-01', 'N', '3rdAuthProvider', '3rdAuthIDbbb', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 'N', 'N', '', '', '', '')
INSERT INTO Members (MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('ccc', 'MemberPWD', 'ccc@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'ccc', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'LastMACAddress', 'N', '1900-01-01', 'N', '3rdAuthProvider', '3rdAuthIDccc', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 'N', 'N', '', '', '', '')
INSERT INTO Members (MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('ddd', 'MemberPWD', 'ddd@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'ddd', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'LastMACAddress', 'N', '1900-01-01', 'N', '3rdAuthProvider', '3rdAuthIDddd', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 'N', 'N', '', '', '', '')
INSERT INTO Members (MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('eee', 'MemberPWD', 'eee@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'eee', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'LastMACAddress', 'N', '1900-01-01', 'N', '3rdAuthProvider', '3rdAuthIDeee', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 'N', 'N', '', '', '', '')
--select * from Members

--Insert ItemLists 
--truncate table ItemLists 
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
INSERT INTO ItemLists (ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, IteamCreateAdminID, IteamUpdateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES('itemid1', 'ItemName1', 'ItemDescription', '10', '10', 'ItemCategory1', 'ItemCategory2', 'ItemCategory3', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'IteamCreateAdminID', 'IteamUpdateAdminID', 'N', 'N', '', '', '', '')
INSERT INTO ItemLists (ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, IteamCreateAdminID, IteamUpdateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES('itemid2', 'ItemName2', 'ItemDescription', '20', '10', 'ItemCategory1', 'ItemCategory2', 'ItemCategory3', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'IteamCreateAdminID', 'IteamUpdateAdminID', 'N', 'N', '', '', '', '')
INSERT INTO ItemLists (ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, IteamCreateAdminID, IteamUpdateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES('itemid3', 'ItemName3', 'ItemDescription', '30', '10', 'ItemCategory1', 'ItemCategory2', 'ItemCategory3', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'IteamCreateAdminID', 'IteamUpdateAdminID', 'N', 'N', '', '', '', '')
INSERT INTO ItemLists (ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, IteamCreateAdminID, IteamUpdateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES('itemid4', 'ItemName4', 'ItemDescription', '40', '10', 'ItemCategory1', 'ItemCategory2', 'ItemCategory3', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'IteamCreateAdminID', 'IteamUpdateAdminID', 'N', 'N', '', '', '', '')
--select * from ItemLists

--GiftDepositories table
--truncate table GiftDepositories
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
INSERT INTO GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, SentMemberYN, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('GiftID1', 'itemid1', '1', 'bbb', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'N', '', '', '', '')
INSERT INTO GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, SentMemberYN, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('GiftID2', 'itemid1', '2', 'ccc', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'N', '', '', '', '')
INSERT INTO GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, SentMemberYN, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('GiftID3', 'itemid2', '3', 'bbb', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'N', '', '', '', '')
INSERT INTO GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, SentMemberYN, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('GiftID4', 'itemid2', '4', 'ccc', 'bbb', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'N', '', '', '', '')
--select * from GiftDepositories

--MemberItems table
--truncate table MemberItems
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
INSERT INTO MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberItemsID1', 'aaa', 'itemid1', '1', 'ItemStatus', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberItemsID2', 'aaa', 'itemid2', '1', 'ItemStatus', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberItemsID3', 'aaa', 'itemid3', '1', 'ItemStatus', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberItemsID4', 'bbb', 'itemid1', '1', 'ItemStatus', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberItemsID5', 'aaa', 'itemid4', '1', 'ItemStatus', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')

--select * from MemberItems

--MemberGameInfoes table
--truncate table MemberGameInfoes
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
INSERT INTO MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('aaa', '10', '10', '10', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('bbb', '20', '20', '20', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('ccc', '30', '30', '30', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('ddd', '40', '40', '40', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
--select * from MemberGameInfoes

-- MemberItemPurchases table
--truncate table MemberItemPurchases
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('MemberItemPurchasesID1', 'aaa', 'itemid1', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', '100', 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')
INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('MemberItemPurchasesID2', 'aaa', 'itemid2', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', '100', 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')
INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('MemberItemPurchasesID3', 'aaa', 'itemid3', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', '100', 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')
INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('MemberItemPurchasesID4', 'ccc', 'itemid1', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', '100', 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')
--select * from MemberItems
--select * from MemberItemPurchases

--AdminMembers table
--truncate table AdminMembers
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
INSERT INTO AdminMembers
(AdminMemberID, AdminMemberPWD, AdminMemberEmail, IDCreateAdminMember, AdminGroup, TimeZoneID, PINumber, Name1, Name2, Name3, DOB, LastIPaddress, LastLoginDT, LastLogoutDT, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('admin1', 'AdminMemberPWD', 'admin1@abc.com', 'admin1', 'AdminGroup', 'Korea Standard Time', 'PINumber', 'Name1', 'Name2', 'Name3', '19991212', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO AdminMembers
(AdminMemberID, AdminMemberPWD, AdminMemberEmail, IDCreateAdminMember, AdminGroup, TimeZoneID, PINumber, Name1, Name2, Name3, DOB, LastIPaddress, LastLoginDT, LastLogoutDT, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('admin2', 'AdminMemberPWD', 'admin2@abc.com', 'admin1', 'AdminGroup', 'Korea Standard Time', 'PINumber', 'Name1', 'Name2', 'Name3', '19991212', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO AdminMembers
(AdminMemberID, AdminMemberPWD, AdminMemberEmail, IDCreateAdminMember, AdminGroup, TimeZoneID, PINumber, Name1, Name2, Name3, DOB, LastIPaddress, LastLoginDT, LastLogoutDT, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('admin3', 'AdminMemberPWD', 'admin3@abc.com', 'admin2', 'AdminGroup', 'Korea Standard Time', 'PINumber', 'Name1', 'Name2', 'Name3', '19991212', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO AdminMembers
(AdminMemberID, AdminMemberPWD, AdminMemberEmail, IDCreateAdminMember, AdminGroup, TimeZoneID, PINumber, Name1, Name2, Name3, DOB, LastIPaddress, LastLoginDT, LastLogoutDT, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('admin4', 'AdminMemberPWD', 'admin4@abc.com', 'admin2', 'AdminGroup', 'Korea Standard Time', 'PINumber', 'Name1', 'Name2', 'Name3', '19991212', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
--select * from AdminMembers

--MemberGameInfoStages table
--truncate table MemberGameInfoStages
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
INSERT INTO MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberGameInfoStageID1', 'aaa', 'StageName1', 'StageStatus', 'Category1', 'Category2', 'Category3', 'Mission1', 'Mission2', 'Mission3', 'Mission4', 'Mission5', '100', 'StageStat1', 'StageStat2', 'StageStat3', 'StageStat4', 'StageStat5', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberGameInfoStageID2', 'aaa', 'StageName2', 'StageStatus', 'Category1', 'Category2', 'Category3', 'Mission1', 'Mission2', 'Mission3', 'Mission4', 'Mission5', '100', 'StageStat1', 'StageStat2', 'StageStat3', 'StageStat4', 'StageStat5', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberGameInfoStageID3', 'aaa', 'StageName3', 'StageStatus', 'Category1', 'Category2', 'Category3', 'Mission1', 'Mission2', 'Mission3', 'Mission4', 'Mission5', '100', 'StageStat1', 'StageStat2', 'StageStat3', 'StageStat4', 'StageStat5', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberGameInfoStageID4', 'bbb', 'StageName1', 'StageStatus', 'Category1', 'Category2', 'Category3', 'Mission1', 'Mission2', 'Mission3', 'Mission4', 'Mission5', '100', 'StageStat1', 'StageStat2', 'StageStat3', 'StageStat4', 'StageStat5', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
--select * from MemberGameInfoStages

--Notices table
--truncate table Notices
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
insert into Notices(NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, NoticeDurationFrom, NoticeDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('NoticeID1', 'NoticeCategory1', 'NoticeCategory2', 'NoticeCategory3', 'TargetGroup', 'TargetOS', 'TargetDevice', 'NoticeImageLink', 'title1', 'content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into Notices(NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, NoticeDurationFrom, NoticeDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('NoticeID2', 'NoticeCategory1', 'NoticeCategory2', 'NoticeCategory3', 'TargetGroup', 'TargetOS', 'TargetDevice', 'NoticeImageLink', 'title2', 'content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into Notices(NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, NoticeDurationFrom, NoticeDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('NoticeID3', 'NoticeCategory1', 'NoticeCategory2', 'NoticeCategory3', 'TargetGroup', 'TargetOS', 'TargetDevice', 'NoticeImageLink', 'title3', 'content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into Notices(NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, NoticeDurationFrom, NoticeDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('NoticeID4', 'NoticeCategory1', 'NoticeCategory2', 'NoticeCategory3', 'TargetGroup', 'TargetOS', 'TargetDevice', 'NoticeImageLink', 'title4', 'content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
--select * from Notices

--GameEvents table
--truncate table GameEvents
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
insert into GameEvents(GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, EventDurationFrom, EventDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('evtid1', 'EventCategory1', 'EventCategory2', 'EventCategory3', 'itemid1', 1, 'Itemstatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'EventImageLink', 'Title1', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into GameEvents(GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, EventDurationFrom, EventDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('evtid2', 'EventCategory1', 'EventCategory2', 'EventCategory3', 'itemid2', 2, 'Itemstatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'EventImageLink', 'Title2', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into GameEvents(GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, EventDurationFrom, EventDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('evtid3', 'EventCategory1', 'EventCategory2', 'EventCategory3', 'itemid3', 3, 'Itemstatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'EventImageLink', 'Title3', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into GameEvents(GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, EventDurationFrom, EventDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('evtid4', 'EventCategory1', 'EventCategory2', 'EventCategory3', 'itemid4', 4, 'Itemstatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'EventImageLink', 'Title4', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
--select * from GameEvents
--select * from itemlists

--GameEventMember  table
--truncate table GameEventMember
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
insert into GameEventMember(GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('GameEventMemberID1', 'evtid1', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '' )
insert into GameEventMember(GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('GameEventMemberID2', 'evtid2', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '' )
insert into GameEventMember(GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('GameEventMemberID3', 'evtid3', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '' )
insert into GameEventMember(GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('GameEventMemberID4', 'evtid2', 'bbb', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '' )
--SELECT * FROM GameEventMember

--Coupon  table
--truncate table Coupon
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
insert into Coupon(CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, DupeYN, OrderNumber, CouponDurationFrom, CouponDurationTo, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('cpid1', 'CouponCategory1', 'CouponCategory2', 'CouponCategory3', 'itemid1', '1', 'ItemStatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'Title1', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', '0', '2015-03-01', '2025-04-01', 'admin1', 'N', 'N', '', '', '', '')
insert into Coupon(CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, DupeYN, OrderNumber, CouponDurationFrom, CouponDurationTo, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('cpid2', 'CouponCategory1', 'CouponCategory2', 'CouponCategory3', 'itemid2', '2', 'ItemStatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'Title2', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Y', '0', '2015-03-01', '2025-04-01', 'admin1', 'N', 'N', '', '', '', '')
insert into Coupon(CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, DupeYN, OrderNumber, CouponDurationFrom, CouponDurationTo, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('cpid3', 'CouponCategory1', 'CouponCategory2', 'CouponCategory3', 'itemid3', '3', 'ItemStatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'Title3', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', '0', '2015-03-01', '2025-04-01', 'admin1', 'N', 'N', '', '', '', '')
insert into Coupon(CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, DupeYN, OrderNumber, CouponDurationFrom, CouponDurationTo, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('cpid4', 'CouponCategory1', 'CouponCategory2', 'CouponCategory3', 'itemid4', '4', 'ItemStatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'Title4', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Y', '0', '2015-03-01', '2025-04-01', 'admin1', 'N', 'N', '', '', '', '')
--select * from Coupon
--select * from itemlists

--CouponMember  table
--truncate table Coupon
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
insert into CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('CouponMemberID1', 'cpid1', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
insert into CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('CouponMemberID2', 'cpid2', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
insert into CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('CouponMemberID3', 'cpid3', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
insert into CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('CouponMemberID4', 'cpid4', 'bbb', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
--select * from CouponMember
--select * from Coupon
--select * from Members

--MemberAccountBlockLog  table
--SELECT * FROM MemberAccountBlockLog
--truncate table MemberAccountBlockLog
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
insert into MemberAccountBlockLog(MemberAccountBlockID, MemberID, MemberAccountBlockReasonCategory1, MemberAccountBlockReasonCategory2, MemberAccountBlockReasonCategory3, MemberAccountBlockReason, MemberAccountBlockProcess, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberAccountBlockLog1', 'ddd', 'cheater', 'MemberAccountBlockReasonCategory2', 'MemberAccountBlockReasonCategory3', 'MemberAccountBlockReason', 'blocks tart', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'admin1', 'N', 'N', '', '', '', '')
insert into MemberAccountBlockLog(MemberAccountBlockID, MemberID, MemberAccountBlockReasonCategory1, MemberAccountBlockReasonCategory2, MemberAccountBlockReasonCategory3, MemberAccountBlockReason, MemberAccountBlockProcess, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberAccountBlockLog2', 'ccc', 'cheater', 'MemberAccountBlockReasonCategory2', 'MemberAccountBlockReasonCategory3', 'MemberAccountBlockReason', 'block end', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'admin1', 'N', 'N', '', '', '', '')
insert into MemberAccountBlockLog(MemberAccountBlockID, MemberID, MemberAccountBlockReasonCategory1, MemberAccountBlockReasonCategory2, MemberAccountBlockReasonCategory3, MemberAccountBlockReason, MemberAccountBlockProcess, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberAccountBlockLog3', 'ddd', 'cheater', 'MemberAccountBlockReasonCategory2', 'MemberAccountBlockReasonCategory3', 'MemberAccountBlockReason', 'block canceled', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'admin1', 'N', 'N', '', '', '', '')
insert into MemberAccountBlockLog(MemberAccountBlockID, MemberID, MemberAccountBlockReasonCategory1, MemberAccountBlockReasonCategory2, MemberAccountBlockReasonCategory3, MemberAccountBlockReason, MemberAccountBlockProcess, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('MemberAccountBlockLog4', 'ddd', 'cheater', 'MemberAccountBlockReasonCategory2', 'MemberAccountBlockReasonCategory3', 'MemberAccountBlockReason', 'account delete', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'admin1', 'N', 'N', '', '', '', '')
--select * from MemberAccountBlockLog

--ServerInfo  table
--SELECT * FROM ServerInfo
--truncate table ServerInfo
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ServerInfo'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ServerInfo'
insert into ServerInfo(InfoID, FEServerLists, SocketServerLists, [Version], ResourceLink, EULAText, sCol1, sCol2, sCol3, sCol4, sCol5, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('InfoID1', 'FEServerLists', 'SocketServerLists', '1.0', 'ResourceLink', 'EULAText', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', '1900-01-01', '1900-01-01', '', '1900-01-01')
insert into ServerInfo(InfoID, FEServerLists, SocketServerLists, [Version], ResourceLink, EULAText, sCol1, sCol2, sCol3, sCol4, sCol5, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('InfoID2', 'frontend1,frontend2', 'socketserver1,socketserver2', '1.2', 'bloblink', 'EULA', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', '1900-01-01', '1900-01-01', '', '1900-01-01')
insert into ServerInfo(InfoID, FEServerLists, SocketServerLists, [Version], ResourceLink, EULAText, sCol1, sCol2, sCol3, sCol4, sCol5, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('InfoID3', 'webserver1, webserver2', 'tcpserver1, tcpserver2', '1.0', 'ResourceLink', 'EULAText', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', '1900-01-01', '1900-01-01', '', '1900-01-01')
--SELECT * FROM ServerInfo



/*
truncate table StatsData
*/


insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 110, CONVERT(nvarchar(8), dateadd(hh, -1, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -1, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 150, CONVERT(nvarchar(8), dateadd(hh, -2, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -2, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 130, CONVERT(nvarchar(8), dateadd(hh, -3, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -3, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 200, CONVERT(nvarchar(8), dateadd(hh, -4, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -4, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 210, CONVERT(nvarchar(8), dateadd(hh, -5, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -5, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 300, CONVERT(nvarchar(8), dateadd(hh, -6, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -6, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 400, CONVERT(nvarchar(8), dateadd(hh, -7, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -7, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 550, CONVERT(nvarchar(8), dateadd(hh, -8, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -8, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 780, CONVERT(nvarchar(8), dateadd(hh, -9, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -9, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 500, CONVERT(nvarchar(8), dateadd(hh, -10, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -10, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 200, CONVERT(nvarchar(8), dateadd(hh, -11, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -11, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 400, CONVERT(nvarchar(8), dateadd(hh, -12, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -12, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 450, CONVERT(nvarchar(8), dateadd(hh, -13, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -13, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 430, CONVERT(nvarchar(8), dateadd(hh, -14, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -14, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 330, CONVERT(nvarchar(8), dateadd(hh, -15, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -15, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 230, CONVERT(nvarchar(8), dateadd(hh, -16, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -16, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 210, CONVERT(nvarchar(8), dateadd(hh, -17, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -17, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 430, CONVERT(nvarchar(8), dateadd(hh, -18, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -18, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 490, CONVERT(nvarchar(8), dateadd(hh, -19, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -19, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 620, CONVERT(nvarchar(8), dateadd(hh, -20, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -20, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 660, CONVERT(nvarchar(8), dateadd(hh, -21, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -21, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 710, CONVERT(nvarchar(8), dateadd(hh, -22, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -22, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 650, CONVERT(nvarchar(8), dateadd(hh, -23, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -23, GETUTCDATE()))), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('HAU', 430, CONVERT(nvarchar(8), dateadd(hh, -24, getutcdate()), 112)+ CONVERT(nvarchar(2), DATEPART(hour, dateadd(hh, -24, GETUTCDATE()))), '')

insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 1102, CONVERT(nvarchar(8), dateadd(dd, -1, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 1590, CONVERT(nvarchar(8), dateadd(dd, -2, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 2012, CONVERT(nvarchar(8), dateadd(dd, -3, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 3453, CONVERT(nvarchar(8), dateadd(dd, -4, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 2345, CONVERT(nvarchar(8), dateadd(dd, -5, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 5645, CONVERT(nvarchar(8), dateadd(dd, -6, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 3998, CONVERT(nvarchar(8), dateadd(dd, -7, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 4320, CONVERT(nvarchar(8), dateadd(dd, -8, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 3832, CONVERT(nvarchar(8), dateadd(dd, -9, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 5032, CONVERT(nvarchar(8), dateadd(dd, -10, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 4210, CONVERT(nvarchar(8), dateadd(dd, -11, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 5432, CONVERT(nvarchar(8), dateadd(dd, -12, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 6436, CONVERT(nvarchar(8), dateadd(dd, -13, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 7543, CONVERT(nvarchar(8), dateadd(dd, -14, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 8865, CONVERT(nvarchar(8), dateadd(dd, -15, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 7768, CONVERT(nvarchar(8), dateadd(dd, -16, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 9974, CONVERT(nvarchar(8), dateadd(dd, -17, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 7112, CONVERT(nvarchar(8), dateadd(dd, -18, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 7787, CONVERT(nvarchar(8), dateadd(dd, -19, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 7324, CONVERT(nvarchar(8), dateadd(dd, -20, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 8802, CONVERT(nvarchar(8), dateadd(dd, -21, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 9943, CONVERT(nvarchar(8), dateadd(dd, -22, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 10032, CONVERT(nvarchar(8),dateadd(dd, -23,  getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 11202, CONVERT(nvarchar(8),dateadd(dd, -24,  getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 9768, CONVERT(nvarchar(8), dateadd(dd, -25, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 7789, CONVERT(nvarchar(8), dateadd(dd, -26, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 8876, CONVERT(nvarchar(8), dateadd(dd, -27, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 7644, CONVERT(nvarchar(8), dateadd(dd, -28, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 12243, CONVERT(nvarchar(8), dateadd(dd, -29, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', 10382, CONVERT(nvarchar(8), dateadd(dd, -30, getutcdate()), 112), '')

insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 210.01, CONVERT(nvarchar(8), dateadd(dd, -1, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 232.0044, CONVERT(nvarchar(8), dateadd(dd, -2, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 244.0101, CONVERT(nvarchar(8), dateadd(dd, -3, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 265, CONVERT(nvarchar(8), dateadd(dd, -4, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 276, CONVERT(nvarchar(8), dateadd(dd, -5, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 299, CONVERT(nvarchar(8), dateadd(dd, -6, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 302, CONVERT(nvarchar(8), dateadd(dd, -7, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 283, CONVERT(nvarchar(8), dateadd(dd, -8, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 299, CONVERT(nvarchar(8), dateadd(dd, -9, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 321, CONVERT(nvarchar(8), dateadd(dd, -10, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 211, CONVERT(nvarchar(8), dateadd(dd, -11, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 299, CONVERT(nvarchar(8), dateadd(dd, -12, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 341, CONVERT(nvarchar(8), dateadd(dd, -13, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 331, CONVERT(nvarchar(8), dateadd(dd, -14, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 259, CONVERT(nvarchar(8), dateadd(dd, -15, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 292, CONVERT(nvarchar(8), dateadd(dd, -16, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 320, CONVERT(nvarchar(8), dateadd(dd, -17, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 329, CONVERT(nvarchar(8), dateadd(dd, -18, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 353, CONVERT(nvarchar(8), dateadd(dd, -19, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 398, CONVERT(nvarchar(8), dateadd(dd, -20, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 406, CONVERT(nvarchar(8), dateadd(dd, -21, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 429, CONVERT(nvarchar(8), dateadd(dd, -22, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 449, CONVERT(nvarchar(8), dateadd(dd, -23, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 476, CONVERT(nvarchar(8), dateadd(dd, -24, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 465, CONVERT(nvarchar(8), dateadd(dd, -25, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 430, CONVERT(nvarchar(8), dateadd(dd, -26, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 410, CONVERT(nvarchar(8), dateadd(dd, -27, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 432, CONVERT(nvarchar(8), dateadd(dd, -28, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 292, CONVERT(nvarchar(8), dateadd(dd, -29, getutcdate()), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DARPU', 543, CONVERT(nvarchar(8), dateadd(dd, -30, getutcdate()), 112), '')


----------------------------------------------------------------------------------------------------------------
-- insert script end 
----------------------------------------------------------------------------------------------------------------

