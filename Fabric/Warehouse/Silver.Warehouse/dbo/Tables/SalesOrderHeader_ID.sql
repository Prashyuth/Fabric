CREATE TABLE [dbo].[SalesOrderHeader_ID] (

	[SalesOrderID] uniqueidentifier NOT NULL, 
	[RevisionNumber] bigint NOT NULL, 
	[OrderDate] datetime2(6) NOT NULL, 
	[DueDate] datetime2(6) NOT NULL, 
	[ShipDate] datetime2(6) NULL, 
	[Status] bigint NOT NULL, 
	[OnlineOrderFlag] bigint NOT NULL
);