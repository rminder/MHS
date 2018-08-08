CREATE TABLE [SL].[Company] (
    [RowId]                  INT          IDENTITY (1, 1) NOT NULL,
    [CompanyId]              VARCHAR (10) NOT NULL,
    [IsActive]               BIT          NOT NULL,
    [Address1]               VARCHAR (30) NOT NULL,
    [Address2]               VARCHAR (30) NOT NULL,
    [BaseCurrencyId]         VARCHAR (4)  NOT NULL,
    [City]                   VARCHAR (30) NOT NULL,
    [Country]                VARCHAR (3)  NOT NULL,
    [CompanyChartOfAccounts] VARCHAR (10) NOT NULL,
    [CompanySubAccounts]     VARCHAR (24) NOT NULL,
    [CompanyName]            VARCHAR (30) NOT NULL,
    [Fax]                    VARCHAR (30) NOT NULL,
    [FederalTaxId]           VARCHAR (12) NOT NULL,
    [Phone]                  VARCHAR (30) NOT NULL,
    [State]                  VARCHAR (3)  NOT NULL,
    [Zip]                    VARCHAR (10) NOT NULL,
    CONSTRAINT [PKCompany] PRIMARY KEY NONCLUSTERED ([RowId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Company_CompanyId]
    ON [SL].[Company]([CompanyId] ASC);

