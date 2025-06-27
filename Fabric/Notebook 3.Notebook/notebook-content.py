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
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!
df=spark.read.format("CSV").option("header","true").load("Files/fabric/sales_nospace.csv")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df.write.format("delta").save("Files/fabric/Parquet2/sales")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
