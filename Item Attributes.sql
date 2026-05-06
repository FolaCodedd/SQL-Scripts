/****** Object:  Table [dbo].[Sarto$LSC Attribute Value$5ecfc871-5d82-43f1-9c54-59685e82318d]    Script Date: 20/05/2025 19:30:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sarto$LSC Attribute Value$5ecfc871-5d82-43f1-9c54-59685e82318d](
	[timestamp] [timestamp] NOT NULL,
	[Link Field 1] [nvarchar](20) NOT NULL,
	[Attribute Code] [nvarchar](20) NOT NULL,
	[Attribute Value] [nvarchar](250) NOT NULL,
	[Sequence] [int] NOT NULL,
	[Link Type] [int] NOT NULL,
	[Link Field 2] [nvarchar](20) NOT NULL,
	[Link Field 3] [nvarchar](20) NOT NULL,
	[Numeric Value] [decimal](38, 20) NOT NULL,
	[Date Value] [datetime] NOT NULL,
	[Hard Attribute] [tinyint] NOT NULL,
	[Item Category Code] [nvarchar](20) NOT NULL,
	[Retail Product Code] [nvarchar](20) NOT NULL,
	[Division Code] [nvarchar](10) NOT NULL,
	[Value Calculated] [int] NOT NULL,
	[Item Is Recipe] [tinyint] NOT NULL,
	[$systemId] [uniqueidentifier] NOT NULL,
	[$systemCreatedAt] [datetime] NOT NULL,
	[$systemCreatedBy] [uniqueidentifier] NOT NULL,
	[$systemModifiedAt] [datetime] NOT NULL,
	[$systemModifiedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [Sarto$LSC Attribute Value$5ecfc871-5d82-43f1-9c54-59685e82318d$Key1] PRIMARY KEY CLUSTERED 
(
	[Link Type] ASC,
	[Link Field 1] ASC,
	[Link Field 2] ASC,
	[Link Field 3] ASC,
	[Attribute Code] ASC,
	[Sequence] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Sarto$LSC Attribute Value$5ecfc871-5d82-43f1-9c54-59685e82318d$$systemId] UNIQUE NONCLUSTERED 
(
	[$systemId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

