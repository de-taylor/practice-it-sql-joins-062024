-- Try It: Left JOIN
-- 1 to 1
-- 1. Create views
CREATE VIEW customer_email_a
AS SELECT
  CustomerKey,
  EmailAddress 
FROM DimCustomer
WHERE EmailAddress LIKE '%a%@adventure-works.com';

CREATE VIEW customer_address_us
AS SELECT
  CustomerKey,
  AddressLine1,
  AddressLine2,
  DimCustomer.GeographyKey
FROM DimCustomer
INNER JOIN DimGeography
  ON DimCustomer.GeographyKey = DimGeography.GeographyKey
WHERE DimGeography.CountryRegionCode = 'US';

DROP VIEW customer_address_us

-- 2. Query
SELECT
  C.CustomerKey,
  C.FirstName,
  C.LastName,
  A.EmailAddress,
  B.GeographyKey
FROM DimCustomer AS C
LEFT OUTER JOIN customer_email_a AS A
  ON C.CustomerKey = A.CustomerKey
LEFT OUTER JOIN customer_address_us AS B
  ON C.CustomerKey = B.CustomerKey;


-- 1 to many
-- return DimProduct.ProductKey and total sales for each product from FactInternetSales
SELECT
  DPr.ProductKey,
  -- accumulated revenue, money
  (SUM(FIS.SalesAmount) * FIS.OrderQuantity) AS SumOfSales,
  -- total number sold of a certain product
  (COUNT(FIS.ProductKey) * FIS.OrderQuantity) AS TotalSales
FROM DimProduct DPr
  LEFT OUTER JOIN FactInternetSales FIS
    ON DPr.ProductKey = FIS.ProductKey
GROUP BY DPr.ProductKey
ORDER BY TotalSales DESC;

-- return DimProduct.ProductKey and DimProduct.EnglishProductName, FactInternetSales.OrderDate,
-- FactInternetSales.OrderQuantity, FactInternetSales.SalesAmount
SELECT
  DPr.ProductKey,
  DPr.EnglishProductName,
  FIS.OrderDate,
  FIS.OrderQuantity,
  FIS.SalesAmount
FROM DimProduct DPr
  LEFT JOIN FactInternetSales FIS
    ON DPr.ProductKey = FIS.ProductKey
ORDER BY FIS.SalesAmount DESC, DPr.ProductKey;