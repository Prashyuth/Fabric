-- Auto Generated (Do not modify) A168542B04E9DCBA741E0BD16ACBC743C33D19B8E2C33B77E257363A2757CBE9
CREATE VIEW [dbo].[vProductWieghtGroup] AS (select [rows].[SalesOrderID] as [SalesOrderID],
    sum([rows].[Weight]) as [ProductSales]
from 
(
    select [SalesOrderID],
        [Weight]
    from [Silver].[dbo].[Sales SalesOrderDetail] as [$Table]
) as [rows]
group by [SalesOrderID])