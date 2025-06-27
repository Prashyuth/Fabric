-- Auto Generated (Do not modify) F064DFD5A0957199290EC1B1EF3BFCDE5989D921C1F48E23F9E9AC8B7E5D243E
CREATE VIEW [dbo].[Mergesample] AS (select [_].[SalesOrderID] as [SalesOrderID],
    [_].[ProductSales] as [ProductSales],
    null as [CustomerID],
    null as [PersonID],
    null as [StoreID],
    null as [TerritoryID],
    null as [AccountNumber],
    null as [rowguid],
    null as [ModifiedDate]
from 
(
    select [rows].[SalesOrderID] as [SalesOrderID],
        sum([rows].[Weight]) as [ProductSales]
    from 
    (
        select [SalesOrderID],
            [Weight]
        from [Silver].[dbo].[Sales SalesOrderDetail] as [$Table]
    ) as [rows]
    group by [SalesOrderID]
) as [_]
union all select null as [SalesOrderID],
    null as [ProductSales],
    [_].[CustomerID] as [CustomerID],
    [_].[PersonID] as [PersonID],
    [_].[StoreID] as [StoreID],
    [_].[TerritoryID] as [TerritoryID],
    [_].[AccountNumber] as [AccountNumber],
    [_].[rowguid] as [rowguid],
    [_].[ModifiedDate] as [ModifiedDate]
from [Silver].[dbo].[Sales.Customer] as [_])