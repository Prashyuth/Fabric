[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Item_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Item = let
  Source = Excel.Workbook(Web.Contents("https://github.com/Prashyuth/Fabric/raw/refs/heads/main/Sales%20Data%20for%20Fabric%20(2).xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Item", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ItemId", Int64.Type}, {"Name", type text}, {"BrandId", Int64.Type}, {"CategoryId", Int64.Type}, {"SubCategoryId", Int64.Type}, {"Brand", type text}, {"Category", type text}, {"SubCategory", type text}})
in
  #"Changed column type";
shared Customer = let
  Source = Excel.Workbook(Web.Contents("https://github.com/Prashyuth/Fabric/raw/refs/heads/main/Sales%20Data%20for%20Fabric%20(2).xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Customer", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"CustomerId", Int64.Type}, {"Age", Int64.Type}, {"City", type text}, {"State", type text}, {"Name", type text}})
in
  #"Changed column type";
shared Sales = let
  Source = Excel.Workbook(Web.Contents("https://github.com/Prashyuth/Fabric/raw/refs/heads/main/Sales%20Data%20for%20Fabric%20(2).xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Sales", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"OrderNo", Int64.Type}, {"ItemID", Int64.Type}, {"SalesDate", type date}, {"DeilveryDate", type date}, {"CustomerId", Int64.Type}, {"CityId", Int64.Type}, {"Qty", Int64.Type}, {"Price", Int64.Type}, {"cost", Int64.Type}, {"DiscountPercent", Int64.Type}})
in
  #"Changed column type";
shared Geography = let
  Source = Excel.Workbook(Web.Contents("https://github.com/Prashyuth/Fabric/raw/refs/heads/main/Sales%20Data%20for%20Fabric%20(2).xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Geography", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"CityId", Int64.Type}, {"City", type text}, {"State", type text}})
in
  #"Changed column type";
shared Item_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "f05d9881-ec1f-432b-b114-c6c06fce28b9"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "8ef64320-ac84-4829-9d0b-407c66bfb9bc"]}[Data],
  TableNavigation = Navigation_2{[Id = "Item", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
