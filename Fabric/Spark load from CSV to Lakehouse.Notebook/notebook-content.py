# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "ebc3763c-04cd-44ec-b374-b18a66e21391",
# META       "default_lakehouse_name": "Bronze",
# META       "default_lakehouse_workspace_id": "bd9b2ab8-d282-4054-905e-a13e85d43ac6",
# META       "known_lakehouses": [
# META         {
# META           "id": "ebc3763c-04cd-44ec-b374-b18a66e21391"
# META         }
# META       ]
# META     },
# META     "environment": {
# META       "environmentId": "5c0f2b0c-0173-bf55-461a-5d0afee2db14",
# META       "workspaceId": "00000000-0000-0000-0000-000000000000"
# META     }
# META   }
# META }

# CELL ********************

import pandas as pd

wrangler_sample_df = pd.read_csv("https://aka.ms/wrangler/titanic.csv")
display(wrangler_sample_df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "editable": true
# META }

# CELL ********************


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!
#loading files from file folder CSV to Table in lakehouse

df = spark.read.format("csv").option("header","true").load("abfss://bd9b2ab8-d282-4054-905e-a13e85d43ac6@onelake.dfs.fabric.microsoft.com/ebc3763c-04cd-44ec-b374-b18a66e21391/Files/Retail1.csv")
table_name = "Retail1"
display(df)



# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df = spark.read.parquet("Tables/Retail1/part-00000-0a685b57-c30a-4ae6-92ed-a340e4508f32-c000.snappy.parquet")
# df now is a Spark DataFrame containing parquet data from "Tables/Retail1/part-00000-0a685b57-c30a-4ae6-92ed-a340e4508f32-c000.snappy.parquet".
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df.write.mode("overwrite").format("delta").saveAsTable("Retail_CSV")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%sql
# MAGIC SELECT * FROM Bronze.Retail1 LIMIT 1000

# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%sql
# MAGIC UPDATE Retail1
# MAGIC SET Price = Price * 0.9
# MAGIC WHERE itemid = 13;

# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%sql
# MAGIC DESCRIBE HISTORY Retail1;


# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

delta_table_path = 'abfss://bd9b2ab8-d282-4054-905e-a13e85d43ac6@onelake.dfs.fabric.microsoft.com/ebc3763c-04cd-44ec-b374-b18a66e21391/Tables/Retail1'
# Get the current data
current_data = spark.read.format("delta").load(delta_table_path)
display(current_data)

# Get the version 0 data
original_data = spark.read.format("delta").option("versionAsOf", 0).load(delta_table_path)
display(original_data)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
