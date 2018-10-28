CREATE TABLE [dbo].[Voter]
(
	[VoterId] INT NOT NULL PRIMARY KEY CLUSTERED ,
    [UN] [nvarchar](max) NULL,
	[PARTY] [nvarchar](max) NULL,
	[D/P] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[MiddleName] [nvarchar](max) NULL,
	[Suffix] [nvarchar](max) NULL,
	[RegDate] [nvarchar](max) NULL,
	[OrgRegDate] [nvarchar](max) NULL,
	[DistDate] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[MailingAddr1] [nvarchar](max) NULL,
	[MailingADdr2] [nvarchar](max) NULL,
	[MailingAddr3] [nvarchar](max) NULL,
	[MailingCity] [nvarchar](max) NULL,
	[MailingState] [nvarchar](max) NULL,
	[MailingZip] [nvarchar](max) NULL,
	[MailingCountry] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
    [ValidFrom] datetime2 (2) GENERATED ALWAYS AS ROW START,  
    [ValidTo] datetime2 (2) GENERATED ALWAYS AS ROW END,  
    PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)
) 
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Voter_Temporal)); 
