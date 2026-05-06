/****** Object:  StoredProcedure [dbo].[dimMergedAttributeValue]    Script Date: 20/05/2025 19:42:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dimMergedAttributeValue]
AS
BEGIN
    SET NOCOUNT ON;

    -- Declare variables for cursor
    DECLARE @No NVARCHAR(50);
    DECLARE @SK_Item BIGINT;

    -- Cursor to loop through tDItem
    DECLARE item_cursor CURSOR FOR
    SELECT [No], [SK_Item]
    FROM [DW].[dItem];

    OPEN item_cursor;
    FETCH NEXT FROM item_cursor INTO @No, @SK_Item;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Check if records exist in [dAttributeValue] for this Item No and SK_Item
        IF EXISTS (
            SELECT 1
            FROM [DW].[dAttributeValue]
            WHERE [Link Field 1] = @No
            AND [SK_Item] = @SK_Item
        )
        BEGIN
            -- Update existing records with most recent values from stg$Attribute Value
            WITH LatestAttributes AS (
                SELECT
                    [CompanyPrefix],
                    [Link Field 1],
                    [Attribute Code],
                    [Attribute Value],
                    [Link Type],
                    [Link Field 2],
                    [Link Field 3],
                    [Numeric Value],
                    [Date Value],
                    [Hard Attribute],
                    [Item Category Code],
                    [Retail Product Code],
                    [Division Code],
                    [Value Calculated],
                    [Item Is Recipe],
                    [bigint_timestamp],
                    ROW_NUMBER() OVER (
                        PARTITION BY [CompanyPrefix], [Link Field 1], [Attribute Code], [Link Type], [Link Field 2], [Link Field 3]
                        ORDER BY [bigint_timestamp] DESC
                    ) AS rn
                FROM [stg$Attribute Value]
                WHERE [Link Field 1] = @No
            )
            UPDATE tAV
            SET
                tAV.[Attribute Value] = la.[Attribute Value],
                tAV.[Numeric Value] = la.[Numeric Value],
                tAV.[Date Value] = la.[Date Value],
                tAV.[Hard Attribute] = la.[Hard Attribute],
                tAV.[Item Category Code] = la.[Item Category Code],
                tAV.[Retail Product Code] = la.[Retail Product Code],
                tAV.[Division Code] = la.[Division Code],
                tAV.[Value Calculated] = la.[Value Calculated],
                tAV.[Item Is Recipe] = la.[Item Is Recipe],
                tAV.[BatchDate] = GETUTCDATE(),
                tAV.[RowID] = la.[bigint_timestamp]
            FROM [DW].[dAttributeValue] tAV
            JOIN LatestAttributes la
                ON tAV.[Company] = la.[CompanyPrefix]
                AND tAV.[Link Field 1] = la.[Link Field 1]
                AND tAV.[Attribute Code] = la.[Attribute Code]
                AND tAV.[Link Type] = la.[Link Type]
                AND tAV.[Link Field 2] = la.[Link Field 2]
                AND tAV.[Link Field 3] = la.[Link Field 3]
                AND tAV.[SK_Item] = @SK_Item
            WHERE la.rn = 1;
        END
        ELSE
        BEGIN
            -- Insert new records from stg$Attribute Value for this Item No
            INSERT INTO [DW].[dAttributeValue] (
                [Company],
                [Link Field 1],
                [Attribute Code],
                [Attribute Value],
                [Link Type],
                [Link Field 2],
                [Link Field 3],
                [Numeric Value],
                [Date Value],
                [Hard Attribute],
                [Item Category Code],
                [Retail Product Code],
                [Division Code],
                [Value Calculated],
                [Item Is Recipe],
                [BatchDate],
                [RowID],
                [SK_Item]
            )
            SELECT
                [CompanyPrefix],
                [Link Field 1],
                [Attribute Code],
                [Attribute Value],
                [Link Type],
                [Link Field 2],
                [Link Field 3],
                [Numeric Value],
                [Date Value],
                [Hard Attribute],
                [Item Category Code],
                [Retail Product Code],
                [Division Code],
                [Value Calculated],
                [Item Is Recipe],
                GETUTCDATE(),
                [bigint_timestamp],
                @SK_Item
            FROM [stg$Attribute Value]
            WHERE [Link Field 1] = @No;
        END

        FETCH NEXT FROM item_cursor INTO @No, @SK_Item;
    END

    CLOSE item_cursor;
    DEALLOCATE item_cursor;
END;
GO

