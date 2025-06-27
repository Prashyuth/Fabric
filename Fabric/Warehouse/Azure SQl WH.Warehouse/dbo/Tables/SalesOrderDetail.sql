CREATE TABLE [dbo].[SalesOrderDetail] (

	[SalesOrderID] int NULL, 
	[SalesOrderDetailID] varchar(8000) NULL, 
	[OrderQty] varchar(8000) NULL, 
	[ProductID] varchar(8000) NULL, 
	[UnitPrice] varchar(8000) NULL, 
	[UnitPriceDiscount] varchar(8000) NULL, 
	[LineTotal] varchar(8000) NULL, 
	[rowguid] varchar(8000) NULL, 
	[ModifiedDate] datetime2(6) NULL
);