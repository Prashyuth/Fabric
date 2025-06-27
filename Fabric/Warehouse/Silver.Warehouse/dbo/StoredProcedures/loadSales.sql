CREATE PROCEDURE dbo.loadSales
AS
BEGIN

insert into [Silver].[dbo].[SalesOrderHeader.Stg](
    [SalesOrderID],
			[RevisionNumber],
			[OrderDate],
			[DueDate],
			[ShipDate],
			[Status],
			[OnlineOrderFlag],
			[SalesOrderNumber],
			[PurchaseOrderNumber],
			[AccountNumber],
			[CustomerID],
			[SalesPersonID],
			[TerritoryID],
			[BillToAddressID],
			[ShipToAddressID],
			[ShipMethodID],
			[CreditCardID],
			[CreditCardApprovalCode],
			[CurrencyRateID],
			[SubTotal],
			[TaxAmt],
			[Freight],
			[TotalDue],
			[Comment],
			[rowguid],
			[ModifiedDate]
)
select A.* from 
(select [SalesOrderID],
			[RevisionNumber],
			[OrderDate],
			[DueDate],
			[ShipDate],
			[Status],
			[OnlineOrderFlag],
			[SalesOrderNumber],
			[PurchaseOrderNumber],
			[AccountNumber],
			[CustomerID],
			[SalesPersonID],
			[TerritoryID],
			[BillToAddressID],
			[ShipToAddressID],
			[ShipMethodID],
			[CreditCardID],
			[CreditCardApprovalCode],
			[CurrencyRateID],
			[SubTotal],
			[TaxAmt],
			[Freight],
			[TotalDue],
			[Comment],
			[rowguid],
			[ModifiedDate]  from [dbo].[SalesOrderHeader.Stg] )  A
left Join dbo.SalesOrderHeader  f on A.SalesOrderID = f.SalesOrderID
where f.SalesOrderID is null   ;


update dbo.incr_info 
set collectdate = (select max(OrderDate ) from [dbo].[SalesOrderHeader.Stg])
where tablename1 = 'sales';


end