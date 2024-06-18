-- Inner JOIN
-- SELECT *
-- FROM table_a ta
-- INNER JOIN table_b tb
--  ON ta.ID = tb.ID;

-- Try It: Inner JOIN
-- 1-1 join
-- first, needed to make a new table and poplate it
-- CREATE TABLE DimEmployeeHR (
--   EmployeeKey int NOT NULL PRIMARY KEY,
--   Title nvarchar(50) NULL,
--   HireDate date NULL,
--   SalariedFlag bit NULL,
--   PayFrequency tinyint NULL,
--   BaseRate money NULL,
--   VacationHours smallint NULL,
--   SickLeaveHours smallint NULL,
--   CurrentFlag bit NOT NULL,
--   StartDate date NULL,
--   EndDate date NULL,
--   Status nvarchar(50) NULL
-- );

-- INSERT INTO DimEmployeeHR
SELECT
  EmployeeKey,
  Title,
  HireDate,
  SalariedFlag,
  PayFrequency,
  BaseRate,
  VacationHours,
  SickLeaveHours,
  CurrentFlag,
  StartDate,
  EndDate,
  Status
FROM DimEmployee;

-- another solution: views
CREATE VIEW vwEmployee_HR
AS SELECT
  EmployeeKey,
  Title,
  HireDate,
  SalariedFlag,
  PayFrequency,
  BaseRate,
  VacationHours,
  SickLeaveHours,
  CurrentFlag,
  StartDate,
  EndDate,
  Status
FROM DimEmployee;

CREATE VIEW vwEmployee_Other
AS SELECT
  EmployeeKey,
  ParentEmployeeKey,
  EmployeeNationalIDAlternateKey,
  SalesTerritoryKey,
  FirstName,
  LastName,
  MiddleName,
  NameStyle,
  BirthDate,
  LoginID,
  EmailAddress,
  Phone,
  MaritalStatus,
  EmergencyContactName,
  EmergencyContactPhone,
  Gender,
  SalesPersonFlag,
  DepartmentName
FROM DimEmployee;

-- 1-1 query old
-- SELECT
--   DimEmployee.EmployeeKey,
--   DimEmployee.ParentEmployeeKey,
--   DimEmployee.EmployeeNationalIDAlternateKey,
--   DimEmployee.SalesTerritoryKey,
--   DimEmployee.FirstName,
--   DimEmployee.LastName,
--   DimEmployee.MiddleName,
--   DimEmployee.NameStyle,
--   DimEmployeeHR.Title,
--   DimEmployeeHR.HireDate,
--   DimEmployee.BirthDate,
--   DimEmployee.LoginID,
--   DimEmployee.EmailAddress,
--   DimEmployee.Phone,
--   DimEmployee.MaritalStatus,
--   DimEmployee.EmergencyContactName,
--   DimEmployee.EmergencyContactPhone,
--   DimEmployeeHR.SalariedFlag,
--   DimEmployee.Gender,
--   DimEmployeeHR.PayFrequency,
--   DimEmployeeHR.BaseRate,
--   DimEmployeeHR.VacationHours,
--   DimEmployeeHR.SickLeaveHours,
--   DimEmployeeHR.CurrentFlag,
--   DimEmployee.SalesPersonFlag,
--   DimEmployee.DepartmentName,
--   DimEmployeeHR.StartDate,
--   DimEmployeeHR.EndDate,
--   DimEmployeeHR.Status
-- FROM DimEmployee
-- INNER JOIN DimEmployeeHR
--   ON DimEmployee.EmployeeKey = DimEmployeeHR.EmployeeKey;

-- 1-1 query new
SELECT
  *
FROM vwEmployee_HR
INNER JOIN vwEmployee_Other
  ON vwEmployee_HR.EmployeeKey = vwEmployee_Other.EmployeeKey;

-- 1 to many relationship... let's do DimCustomer to FactSurveyResponse
SELECT *
FROM DimCustomer
INNER JOIN FactSurveyResponse
  ON DimCustomer.CustomerKey = FactSurveyResponse.CustomerKey;


-- many to many relationship... let's do FactCurrencyRate.Date to FactSurveyResponse.Date
SELECT *
FROM FactCurrencyRate
INNER JOIN FactSurveyResponse
 ON FactCurrencyRate.Date = FactSurveyResponse.Date;

-- Try It: Self JOIN