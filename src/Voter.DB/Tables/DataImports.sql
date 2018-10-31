CREATE TABLE [dbo].[DataImports]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FileName] VARCHAR(200) NOT NULL, 
    [FileDate] DATE NOT NULL,
    [ImportDate] DATETIME NOT NULL,
    [Note] VARCHAR(max) NULL
)
