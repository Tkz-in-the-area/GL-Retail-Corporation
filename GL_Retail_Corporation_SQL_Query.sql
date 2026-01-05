-- Scenario: SQL Query for Financial Statement Data (GL Retail Corporation) --
-- Purpose: Certain Columns are needed for Further Processing & Analysis --
-- Goal: Create a Query that achieves the above statement --

SELECT

-- [FactGLTran] Transaction Infomation --
gl.FactGLTranID,
gl.GLTranAmount,
gl.JournalID,
gl.GLTranDescription,
gl.GLTranDate,

-- [GL Accounts] Finanical Infomation --
acc.AlternateKey 'GLAcctNum',
acc.GLAcctName,
acc.Statement,
acc.Category,
acc.Subcategory,

-- [Stores] Store Specific Information --
sto.AlternateKey 'StoreNum',
sto.StoreName,
sto.ManagerID,
sto.PreviousManagerID,
sto.ContactTel,
sto.AddressLine1,
sto.AddressLine2,
sto.ZipCode,

-- [Region} Location Split Over Four Territories --
reg.AlternateKey 'RegionNum',
reg.RegionName,
reg.SalesRegionName,

-- Last Refresh Date As Per Request By Head Office --
CONVERT(datetime2, GETDATE() at time zone 'UTC' at time zone 'Central Standard Time') AS 'LastRefreshDate'

FROM FactGLTran AS gl
    INNER JOIN dimGLAcct AS acc ON gl.GLAcctID = acc.GLAcctID
    INNER JOIN dimStore AS sto ON gl.StoreID = sto.StoreID
    INNER JOIN dimRegion AS reg ON sto.RegionID = reg.RegionID

-- If View Is Needed --
--  CREATE VIEW vwGLTrans --
-- AS --
-- Query Here --
-- Go --