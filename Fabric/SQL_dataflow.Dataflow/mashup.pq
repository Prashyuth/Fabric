[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Sales vStoreWithContacts_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"Sales vStoreWithContacts" = let
  Source = Sql.Database("KSPL228", "AdventureWorks2019"),
  #"Navigation 1" = Source{[Schema = "Sales", Item = "vStoreWithContacts"]}[Data]
in
  #"Navigation 1";
shared DefaultDestination = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  #"Navigation 1" = Source{[workspaceId = "bd9b2ab8-d282-4054-905e-a13e85d43ac6"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "6f5ed366-8ac6-4a0c-84e3-5b1b6a0ff7a3"]}[Data]
in
  #"Navigation 2";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Sales SalesOrderDetail_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"Sales SalesOrderDetail" = let
  Source = Sql.Database("KSPL228", "AdventureWorks2019"),
  #"Navigation 1" = Source{[Schema = "Sales", Item = "SalesOrderDetail"]}[Data],
  #"Removed columns" = Table.RemoveColumns(#"Navigation 1", {"Sales.SalesOrderHeader", "Sales.SpecialOfferProduct"})
in
  #"Removed columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Sales vSalesPerson_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"Sales vSalesPerson" = let
  Source = Sql.Database("KSPL228", "AdventureWorks2019"),
  #"Navigation 1" = Source{[Schema = "Sales", Item = "vSalesPerson"]}[Data]
in
  #"Navigation 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Sales vStoreWithContacts (2)_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"Sales vStoreWithContacts (2)" = let
  Source = Sql.Database("KSPL228", "AdventureWorks2019"),
  #"Navigation 1" = Source{[Schema = "Sales", Item = "vStoreWithContacts"]}[Data]
in
  #"Navigation 1";
shared #"Sales vStoreWithContacts_DataDestination" = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "bd9b2ab8-d282-4054-905e-a13e85d43ac6"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "ebc3763c-04cd-44ec-b374-b18a66e21391"]}[Data],
  TableNavigation = Navigation_2{[Id = "vStoreWithContacts", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared #"Sales SalesOrderDetail_DataDestination" = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "bd9b2ab8-d282-4054-905e-a13e85d43ac6"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "ebc3763c-04cd-44ec-b374-b18a66e21391"]}[Data],
  TableNavigation = Navigation_2{[Id = "SalesOrderDetail", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared #"Sales vSalesPerson_DataDestination" = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "bd9b2ab8-d282-4054-905e-a13e85d43ac6"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "ebc3763c-04cd-44ec-b374-b18a66e21391"]}[Data],
  TableNavigation = Navigation_2{[Id = "vSalesPerson", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared #"Sales vStoreWithContacts (2)_DataDestination" = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "bd9b2ab8-d282-4054-905e-a13e85d43ac6"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "ebc3763c-04cd-44ec-b374-b18a66e21391"]}[Data],
  TableNavigation = Navigation_2{[Id = "vStoreWithContacts", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
