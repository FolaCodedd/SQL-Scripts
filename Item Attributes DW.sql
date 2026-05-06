/****** Object:  Table [DW].[dAttributeValue]    Script Date: 20/05/2025 19:33:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [DW].[dAttributeValue](
	[SK_AttributeValue] [int] IDENTITY(-1,1) NOT NULL,
	[Company] [nvarchar](200) NULL,
	[Attribute Code] [nvarchar](20) NULL,
	[Attribute Value] [nvarchar](250) NULL,
	[Link Type] [int] NULL,
	[Link Field 2] [nvarchar](20) NULL,
	[Link Field 3] [nvarchar](20) NULL,
	[Numeric Value] [decimal](38, 20) NULL,
	[Date Value] [datetime] NULL,
	[Hard Attribute] [tinyint] NULL,
	[Item Category Code] [nvarchar](20) NULL,
	[Retail Product Code] [nvarchar](20) NULL,
	[Division Code] [nvarchar](10) NULL,
	[Value Calculated] [int] NULL,
	[Item Is Recipe] [tinyint] NULL,
	[BatchDate] [datetime2](7) NOT NULL,
	[RowID] [bigint] NOT NULL,
	[SK_Item] [int] NULL,
	[Link Field 1] [nvarchar](20) NULL,
 CONSTRAINT [PK_dAttributeValue] PRIMARY KEY CLUSTERED 
(
	[SK_AttributeValue] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [DW].[dAttributeValue] ADD  DEFAULT (getutcdate()) FOR [BatchDate]
GO

