-- Try It: Multiple Complex JOINs

-- Combine Reseller with DimGeo
-- output reseller mailing addr for customers in a
-- geographic region of my choice (through a where clause)
-- return the products sold for those resellers and their products subcategory

-- DimReseller.GeographyKey = DimGeography.GeographyKey
  -- WHERE DimGeography.CountryRegionCode = 'DE'

SELECT
  DR.ResellerName,
  DR.AddressLine1,
  DG.City,
  DG.StateProvinceName,
  DG.PostalCode,
  DPSC.EnglishProductSubcategoryName,
  DP.EnglishProductName,
  (COUNT(FRS.ProductKey) * FRS.OrderQuantity) AS ProductTotalSales,
  (SUM(FRS.SalesAmount) * FRS.OrderQuantity) AS ProductSalesRevenue
FROM DimReseller DR
INNER JOIN DimGeography DG
  ON DR.GeographyKey = DG.GeographyKey
LEFT OUTER JOIN FactResellerSales FRS
  ON DR.ResellerKey = FRS.ResellerKey
INNER JOIN DimProduct DP
  ON FRS.ProductKey = DP.ProductKey
INNER JOIN DimProductSubCategory DPSC
  ON DP.ProductSubCategoryKey = DPSC.ProductSubCategoryKey
WHERE
  DG.CountryRegionCode = 'DE'
GROUP BY
  DR.ResellerName,
  DR.AddressLine1,
  DG.City,
  DG.StateProvinceName,
  DG.PostalCode,
  DPSC.EnglishProductSubcategoryName,
  DP.EnglishProductName
ORDER BY
  DR.ResellerName,
  DPSC.EnglishProductSubcategoryName,
  DP.EnglishProductName;