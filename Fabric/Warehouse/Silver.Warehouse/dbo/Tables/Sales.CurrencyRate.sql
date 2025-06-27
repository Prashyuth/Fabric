CREATE TABLE [dbo].[Sales.CurrencyRate] (

	[CurrencyRateID] int NULL, 
	[CurrencyRateDate] datetime2(6) NULL, 
	[FromCurrencyCode] varchar(8000) NULL, 
	[ToCurrencyCode] varchar(8000) NULL, 
	[AverageRate] float NULL, 
	[EndOfDayRate] float NULL, 
	[ModifiedDate] date NULL
);