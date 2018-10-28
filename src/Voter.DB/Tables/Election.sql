CREATE TABLE [dbo].[Election]
(
    [ElectionId] INT NOT NULL PRIMARY KEY, 
    [Year] INT NOT NULL, 
    [Location] NCHAR(10) NOT NULL, 
    [Note] VARCHAR(MAX) NULL,
    foo int
)
