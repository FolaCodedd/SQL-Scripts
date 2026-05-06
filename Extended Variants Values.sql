/****** Object:  Table [dbo].[Sarto$LSC Extd_ Variant Values$5ecfc871-5d82-43f1-9c54-59685e82318d]    Script Date: 20/05/2025 19:28:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sarto$LSC Extd_ Variant Values$5ecfc871-5d82-43f1-9c54-59685e82318d](
	[timestamp] [timestamp] NOT NULL,
	[Item No_] [nvarchar](20) NOT NULL,
	[Framework Code] [nvarchar](20) NOT NULL,
	[Value Type] [int] NOT NULL,
	[Code] [nvarchar](30) NOT NULL,
	[Dimension] [int] NOT NULL,
	[Value] [nvarchar](30) NOT NULL,
	[Dimension Link] [nvarchar](30) NOT NULL,
	[Extension] [nvarchar](10) NOT NULL,
	[Comparison Value] [nvarchar](15) NOT NULL,
	[Selection] [tinyint] NOT NULL,
	[Logical Order] [int] NOT NULL,
	[Viewing Color] [int] NOT NULL,
	[Default Variant Weight] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[Value Description] [nvarchar](30) NOT NULL,
	[Attribute 1 Value] [nvarchar](30) NOT NULL,
	[Attribute 2 Value] [nvarchar](30) NOT NULL,
	[Attribute 3 Value] [nvarchar](30) NOT NULL,
	[$systemId] [uniqueidentifier] NOT NULL,
	[$systemCreatedAt] [datetime] NOT NULL,
	[$systemCreatedBy] [uniqueidentifier] NOT NULL,
	[$systemModifiedAt] [datetime] NOT NULL,
	[$systemModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [Sarto$LSC Extd. Variant Values$5ecfc871-5d82-43f1-9c54-59685e82318d$Key1] PRIMARY KEY CLUSTERED 
(
	[Item No_] ASC,
	[Framework Code] ASC,
	[Code] ASC,
	[Value] ASC,
	[Extension] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

