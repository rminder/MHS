CREATE TABLE [SL].[Vendor] (
    [RowId]      INT                                         IDENTITY (1, 1) NOT NULL,
    [City]       VARCHAR (30)                                NOT NULL,
    [ClassId]    VARCHAR (10)                                NOT NULL,
    [Country]    VARCHAR (3)                                 NOT NULL,
    [Name]       VARCHAR (60)                                NOT NULL,
    [State]      VARCHAR (3)                                 NOT NULL,
    [Status]     CHAR (1)                                    NOT NULL,
    [VendorId]   VARCHAR (15)                                NOT NULL,
    [Zip]        VARCHAR (10)                                NOT NULL,
    [LastUpdate] DATETIME2 (7)                               NOT NULL,
    [ImportDate] DATETIME2 (7)                               NOT NULL,
    [ValidFrom]  DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]    DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKVendor] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[VendorHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_Vendor_LastUpdate]
    ON [SL].[Vendor]([LastUpdate] ASC);

