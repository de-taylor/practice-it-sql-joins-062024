-- Right JOIN
-- Try It: Full Outer JOIN
-- perform a full outer join between US customers and the Internet Sales table

SELECT
  DC.CustomerKey,
  DC.FirstName,
  DC.LastName,
  DC.AddressLine1,
  DC.AddressLine2,
  DC.GeographyKey,
  FIS.SalesOrderNumber,
  FIS.ProductKey,
  FIS.SalesAmount,
  FIS.OrderDate,
  FIS.DueDate,
  FIS.ShipDate
FROM DimCustomer DC
LEFT OUTER JOIN FactInternetSales FIS
  ON DC.CustomerKey = FIS.CustomerKey
UNION
SELECT
  DC.CustomerKey,
  DC.FirstName,
  DC.LastName,
  DC.AddressLine1,
  DC.AddressLine2,
  DC.GeographyKey,
  FIS.SalesOrderNumber,
  FIS.ProductKey,
  FIS.SalesAmount,
  FIS.OrderDate,
  FIS.DueDate,
  FIS.ShipDate
FROM FactInternetSales FIS
LEFT OUTER JOIN DimCustomer DC
  ON DC.CustomerKey = FIS.CustomerKey