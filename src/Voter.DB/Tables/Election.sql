CREATE TABLE [dbo].[Election]
(
    [ElectionId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [VoteYear] INT NOT NULL, 
    [VoteElection] NCHAR(10) NOT NULL, 
    [Note] VARCHAR(MAX) NULL,
    [Ceated] DateTime2 NOT NULL
)
