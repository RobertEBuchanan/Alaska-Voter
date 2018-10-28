CREATE TABLE [dbo].[DataImports]
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [FileName] VARCHAR(200) NOT NULL, 
    [FileDate] DATE NOT NULL,
    [ImportDate] DATETIME NOT NULL
)
