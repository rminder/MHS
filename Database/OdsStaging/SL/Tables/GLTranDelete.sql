CREATE TABLE [SL].[GLTranDelete] (
    [BatNbr]  CHAR (10) NOT NULL,
    [LineNbr] SMALLINT  NOT NULL,
    [Module]  CHAR (2)  NOT NULL,
    CONSTRAINT [PkGLTranDelete] PRIMARY KEY CLUSTERED ([BatNbr] ASC, [Module] ASC, [LineNbr] ASC)
);

