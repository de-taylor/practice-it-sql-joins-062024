-- Cross JOIN
-- Try It: Cross JOINs and Cartesian JOINs

SELECT
  DST.SalesTerritoryGroup,
  DST.SalesTerritoryCountry,
  DST.SalesTerritoryRegion,
  DSR.SalesReasonName,
  DSR.SalesReasonReasonType
FROM DimSalesReason AS DSR
CROSS JOIN DimSalesTerritory AS DST
ORDER BY
  DST.SalesTerritoryGroup,
  DST.SalesTerritoryCountry,
  DST.SalesTerritoryRegion