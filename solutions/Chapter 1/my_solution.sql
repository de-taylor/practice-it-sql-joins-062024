-- #########################
-- SQL JOIN and Descriptions
-- #########################
-- View all tables in SQLite DB
SELECT name
FROM sqlite_master
WHERE type = 'table' AND name NOT LIKE 'sqlite_%'
ORDER BY name;

-- #######################################
-- Try It: Schema description SQL commands
-- #######################################
-- 1. List all tables in document
SELECT name
FROM sqlite_master
WHERE type = 'table' AND name NOT LIKE 'sqlite_%'
ORDER BY name;

-- 2. Row count for each table
SELECT COUNT(*) AS DimCurrencyRows
FROM DimCurrency;

SELECT COUNT(*) AS DimCustomerRows
FROM DimCustomer;

SELECT COUNT(*) AS DimDateRows
FROM DimDate;

SELECT COUNT(*) AS DimDepartmentGroupRows
FROM DimDepartmentGroup;

SELECT COUNT(*) AS DimEmployeeRows
FROM DimEmployee;

SELECT COUNT(*) AS DimGeographyRows
FROM DimGeography;

SELECT COUNT(*) AS DimOrganizationRows
FROM DimOrganization;

SELECT COUNT(*) AS DimProductRows
FROM DimProduct;

SELECT COUNT(*) AS DimProductCategoryRows
FROM DimProductCategory;

SELECT COUNT(*) AS DimProductSubcategoryRows
FROM DimProductSubcategory;

SELECT COUNT(*) AS DimPromotionRows
FROM DimPromotion;

SELECT COUNT(*) AS DimResellerRows
FROM DimReseller;

SELECT COUNT(*) AS DimSalesReasonRows
FROM DimSalesReason;

SELECT COUNT(*) AS DimSalesTerritoryRows
FROM DimSalesTerritory;

SELECT COUNT(*) AS FactCurrencyRateRows
FROM FactCurrencyRate;

SELECT COUNT(*) AS FactInternetSalesRows
FROM FactInternetSales;

SELECT COUNT(*) AS FactInternetSalesReasonRows
FROM FactInternetSalesReason;

SELECT COUNT(*) AS FactResellerSalesRows
FROM FactResellerSales;

SELECT COUNT(*) AS FactSurveyResponseRows
FROM FactSurveyResponse;

-- 3. Document the CREATE script for each database table
SELECT sql AS CreateTableScript
FROM sqlite_master
WHERE type = 'table' AND name NOT LIKE 'sqlite_%'
ORDER BY name;

-- ################################################
-- Try It: Table and column description SQL commands
-- ################################################