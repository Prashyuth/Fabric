CREATE TABLE [dbo].[Sales SalesOrderDetail] (

	[SalesOrderID] int NULL, 
	[SalesOrderDetailID] int NULL, 
	[CarrierTrackingNumber] varchar(8000) NULL, 
	[OrderQty] smallint NULL, 
	[ProductID] int NULL, 
	[SpecialOfferID] int NULL, 
	[LineTotal] decimal(38,6) NULL, 
	[rowguid] varchar(8000) NULL, 
	[ModifiedDate] datetime2(6) NULL, 
	[Name] varchar(8000) NULL, 
	[ProductNumber] varchar(8000) NULL, 
	[Color] varchar(8000) NULL, 
	[Size] varchar(8000) NULL, 
	[Weight] decimal(38,6) NULL, 
	[DaysToManufacture] int NULL, 
	[ProductLine] varchar(8000) NULL, 
	[Style] varchar(8000) NULL, 
	[ProductSubcategoryID] int NULL, 
	[ProductModelID] int NULL
);


GO
ALTER TABLE [dbo].[Sales SalesOrderDetail] ADD CONSTRAINT UQ_bdf486d5_79f0_40ac_a95c_834bb21641f7 unique NONCLUSTERED ([ModifiedDate]);