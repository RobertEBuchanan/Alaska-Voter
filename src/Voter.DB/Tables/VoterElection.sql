CREATE TABLE [dbo].[VoterElection]
(
    [VoterId] INT NOT NULL PRIMARY KEY, 
    [ElectionId] INT NOT NULL, 
    [Vote] CHAR(10) NOT NULL, 
    CONSTRAINT [FK_VoterElection_Voter] FOREIGN KEY ([VoterId]) REFERENCES [Voter]([VoterId]), 
    CONSTRAINT [FK_VoterElection_Election] FOREIGN KEY ([ElectionId]) REFERENCES [Election]([ElectionId])
)
