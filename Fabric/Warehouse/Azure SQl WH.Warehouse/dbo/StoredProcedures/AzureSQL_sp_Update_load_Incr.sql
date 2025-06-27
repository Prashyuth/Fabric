CREATE PROC [dbo].[AzureSQL_sp_Update_load_Incr]
@Table_name VArchar(100),
@incremental_load_value Date
AS
BEGIN
Update [dbo].[incr_info] set [Loaddate]=@incremental_load_value 
where tablename=@Table_name
END