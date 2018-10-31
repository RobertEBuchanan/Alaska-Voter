/******************************************************************************
    
    Description:   

    NOTE                
    This looked like a good candidate for a SQL Merge, which I don't normally use.
    After playing with MERGE, and reading A Bertrand's post, I decided not to use it.
    1. The MERGE syntax is more difficult to read and trickier than traditonal methods.
    2. Performance can be an issues.
    3. There are also a few known issues....


    --https://www.mssqltips.com/sqlservertip/1704/using-merge-in-sql-server-to-insert-update-and-delete-at-the-same-time/
    --https://www.mssqltips.com/sqlservertip/3074/use-caution-with-sql-servers-merge-statement/


;WITH 
raw_voter_cte as
(
	SELECT top 10
		[VoterId]			= CONVERT(INT,rsvi.[ASCENSION #]),
		[UN]				= rsvi.UN,
		[Party]				= rsvi.PARTY,
		[District]			= SUBSTRING(rsvi.[D/P],1,2),
		[Precinct]			= rsvi.[D/P],
		[LastName]			= rsvi.[LAST NAME],
		[FirstName]			= rsvi.[FIRST NAME],
		[MiddleName]		= rsvi.[MIDDLE NAME],
		[Suffix]			= rsvi.[SUFFIX NAME],
		[RegDate]			= rsvi.[REG DATE],
		[OrgRegDate]		= rsvi.[ORG REG DATE],
		[DistDate]			= rsvi.[DIST DATE],
		[IsPrivate]			= 1,
		[Address]			= rsvi.[RESIDENCE ADDRESS],
		[City]				= rsvi.[RESIDENCE CITY],
		[Zip]				= rsvi.[RESIDENCE ZIP],
		[MailingAddr1]		= rsvi.[MAILING ADDRESS1],
		[MailingADdr2]		= rsvi.[MAILING ADDRESS2],
		[MailingAddr3]		= rsvi.[MAILING ADDRESS3],
		[MailingCity]		= rsvi.[MAILING CITY],
		[MailingState]		= rsvi.[MAILING STATE],
		[MailingZip]		= rsvi.[MAILING ZIP],
		[MailingCountry]	= rsvi.[MAILING COUNTRY],
		[Gender]			= rsvi.GENDER,
		[start]				= NULL ,
		[end]				= NULL
    FROM dbo.RawStateVoterImport rsvi
	where [last name] like 'A%'	
)
MERGE dbo.voter AS TARGET
USING raw_voter_cte AS SOURCE
ON (TARGET.VoterId = SOURCE.[VoterId])
WHEN MATCHED AND 1=1 THEN
	UPDATE	SET 
		TARGET.[UN]				= SOURCE.[UN]					,		
		TARGET.[Party]			= SOURCE.[Party]				,
		TARGET.[District]		= SOURCE.[District]				,
		TARGET.[Precinct]		= SOURCE.[Precinct]				,
		TARGET.[LastName]		= SOURCE.[LastName]				,
		TARGET.[FirstName]		= SOURCE.[FirstName]			,
		TARGET.[MiddleName]		= SOURCE.[MiddleName]			,
		TARGET.[Suffix]			= SOURCE.[Suffix]				,
		TARGET.[RegDate]		= SOURCE.[RegDate]				,
		TARGET.[OrgRegDate]		= SOURCE.[OrgRegDate]			,
		TARGET.[DistDate]		= SOURCE.[DistDate]				,
		TARGET.[IsPrivate]		= SOURCE.[IsPrivate]			,
		TARGET.[Address]		= SOURCE.[Address]		  		,									
		TARGET.[City]			= SOURCE.[City]					,
		TARGET.[Zip]			= SOURCE.[Zip]					,
		TARGET.[MailingAddr1]	= SOURCE.[MailingAddr1]			,
		TARGET.[MailingADdr2]	= SOURCE.[MailingADdr2]			,
		TARGET.[MailingAddr3]	= SOURCE.[MailingAddr3]			,
		TARGET.[MailingCity]	= SOURCE.[MailingCity]			,
		TARGET.[MailingState]	= SOURCE.[MailingState]			,
		TARGET.[MailingZip]		= SOURCE.[MailingZip]			,
		TARGET.[MailingCountry] = SOURCE.[MailingCountry] 		,
		TARGET.[Gender]			= SOURCE.[Gender]			
		--TARGET.[ValidFrom]		= SOURCE.[start] ,
		--TARGET.[ValidTo]		= SOURCE.[end] 
WHEN NOT MATCHED BY TARGET THEN 
INSERT VALUES 
       (SOURCE.[VoterId]					 ,
	    SOURCE.[UN]					 ,
        SOURCE.[Party]				 ,
        SOURCE.[District]			 ,
        SOURCE.[Precinct]			 ,
        SOURCE.[LastName]			 ,
        SOURCE.[FirstName]			 ,
        SOURCE.[MiddleName]			 ,
        SOURCE.[Suffix]				 ,
        SOURCE.[RegDate]			 ,
        SOURCE.[OrgRegDate]			 ,
        SOURCE.[DistDate]			 ,
        SOURCE.[IsPrivate]			 ,
        SOURCE.[Address]		  	 ,
        SOURCE.[City]				 ,
        SOURCE.[Zip]				 ,
        SOURCE.[MailingAddr1]		 ,
        SOURCE.[MailingADdr2]		 ,
        SOURCE.[MailingAddr3]		 ,
        SOURCE.[MailingCity]		 ,
        SOURCE.[MailingState]		 ,
        SOURCE.[MailingZip]			 ,
        SOURCE.[MailingCountry] 	 ,
        SOURCE.[Gender]	,
		DEFAULT,
		DEFAULT			         
	   )
WHEN NOT MATCHED BY SOURCE THEN 
DELETE
OUTPUT $action,
	Source.VoterId 

	   ;

	   select @@ROWCOUNT;



*******************************************************************************/
CREATE PROCEDURE [dbo].[ParseRawToVoters]
AS
    BEGIN
    
        -- Delete those no long on the rolls
        DELETE FROM dbo.Voter 
            WHERE VoterId not in (SELECT [ASCENSION #] from  dbo.RawStateVoterImport)

        -- Updated Voters which changed data
        ;WITH 
        source_cte as
        (
	        SELECT 
		        [VoterId]			= CONVERT(INT,rsvi.[ASCENSION #]),  
		        [UN]				= rsvi.UN,
		        [Party]				= rsvi.PARTY,
		        [District]			= SUBSTRING(rsvi.[D/P],1,2),
		        [Precinct]			= rsvi.[D/P],
		        [LastName]			= rsvi.[LAST NAME],
		        [FirstName]			= rsvi.[FIRST NAME],
		        [MiddleName]		= rsvi.[MIDDLE NAME],
		        [Suffix]			= rsvi.[SUFFIX NAME],
		        [RegDate]			= rsvi.[REG DATE],
		        [OrgRegDate]		= rsvi.[ORG REG DATE],
		        [DistDate]			= rsvi.[DIST DATE],
		        [IsPrivate]			= 1,
		        [Address]			= rsvi.[RESIDENCE ADDRESS],
		        [City]				= rsvi.[RESIDENCE CITY],
		        [Zip]				= rsvi.[RESIDENCE ZIP],
		        [MailingAddr1]		= rsvi.[MAILING ADDRESS1],
		        [MailingADdr2]		= rsvi.[MAILING ADDRESS2],
		        [MailingAddr3]		= rsvi.[MAILING ADDRESS3],
		        [MailingCity]		= rsvi.[MAILING CITY],
		        [MailingState]		= rsvi.[MAILING STATE],
		        [MailingZip]		= rsvi.[MAILING ZIP],
		        [MailingCountry]	= rsvi.[MAILING COUNTRY],
		        [Gender]			= rsvi.GENDER
            FROM dbo.RawStateVoterImport rsvi
        ),
        target_cte as
        (
	        SELECT 
		        [VoterId]			 ,	
		        [UN]				 ,
		        [Party]				 ,
		        [District]			 ,
		        [Precinct]			 ,
		        [LastName]			 ,
		        [FirstName]			 ,
		        [MiddleName]		 ,
		        [Suffix]			 ,
		        [RegDate]			 ,
		        [OrgRegDate]		 ,
		        [DistDate]			 ,
		        [IsPrivate]			 ,
		        [Address]		  	 ,
		        [City]				 ,
		        [Zip]				 ,
		        [MailingAddr1]		 ,
		        [MailingADdr2]		 ,
		        [MailingAddr3]		 ,
		        [MailingCity]		 ,
		        [MailingState]		 ,
		        [MailingZip]		 ,
		        [MailingCountry] 	 ,
		        [Gender]	
	        FROM  dbo.voter
        )
        , rows_to_update_cte as
        (
	        select * from source_cte

	        except 

	        select * from target_cte 
        )
        update v
	        set					
		        v.[UN]				= rtu.[UN]				,
		        v.[Party]			= rtu.[Party]				,
		        v.[District]		= rtu.[District]			,
		        v.[Precinct]		= rtu.[Precinct]			,
		        v.[LastName]		= rtu.[LastName]			,
		        v.[FirstName]		= rtu.[FirstName]			,
		        v.[MiddleName]		= rtu.[MiddleName]		,
		        v.[Suffix]			= rtu.[Suffix]			,
		        v.[RegDate]			= rtu.[RegDate]			,
		        v.[OrgRegDate]		= rtu.[OrgRegDate]		,
		        v.[DistDate]		= rtu.[DistDate]			,
		        v.[IsPrivate]		= rtu.[IsPrivate]			,
		        v.[Address]		    = rtu.[Address]		    ,
		        v.[City]			= rtu.[City]				,
		        v.[Zip]				= rtu.[Zip]				,
		        v.[MailingAddr1]	= rtu.[MailingAddr1]		,
		        v.[MailingADdr2]	= rtu.[MailingADdr2]		,
		        v.[MailingAddr3]	= rtu.[MailingAddr3]		,
		        v.[MailingCity]		= rtu.[MailingCity]		,
		        v.[MailingState]	= rtu.[MailingState]		,
		        v.[MailingZip]		= rtu.[MailingZip]		,
		        v.[MailingCountry]  = rtu.[MailingCountry]    ,
		        v.[Gender]	        = rtu.[Gender]	        
        from voter v
        join rows_to_update_cte rtu		on v.VoterId = rtu.VoterId

        -- Add new voters
        INSERT INTO [dbo].[Voter](	
			    [VoterId],[UN],[Party],[District],[Precinct],[LastName],[FirstName],[MiddleName],[Suffix],[RegDate],
			    [OrgRegDate],[DistDate],[IsPrivate],[Address],[City],[Zip],[MailingAddr1],[MailingADdr2],[MailingAddr3],
			    [MailingCity],[MailingState],[MailingZip],[MailingCountry],[Gender])
		    SELECT 
			    CONVERT(INT,rsvi.[ASCENSION #]),
			    rsvi.UN,
			    rsvi.PARTY,
			    SUBSTRING(rsvi.[D/P],1,2),
			    rsvi.[D/P],
			    rsvi.[LAST NAME],
			    rsvi.[FIRST NAME],
			    rsvi.[MIDDLE NAME],
			    rsvi.[SUFFIX NAME],
			    rsvi.[REG DATE],
			    rsvi.[ORG REG DATE],
			    rsvi.[DIST DATE],
			    1,
			    rsvi.[RESIDENCE ADDRESS],
			    rsvi.[RESIDENCE CITY],
			    rsvi.[RESIDENCE ZIP],
			    rsvi.[MAILING ADDRESS1],
			    rsvi.[MAILING ADDRESS2],
			    rsvi.[MAILING ADDRESS3],
			    rsvi.[MAILING CITY],
			    rsvi.[MAILING STATE],
			    rsvi.[MAILING ZIP],
			    rsvi.[MAILING COUNTRY],
			    rsvi.GENDER
		    FROM dbo.RawStateVoterImport rsvi
		    where rsvi.[ASCENSION #] not in (select voterId from voter )
    END

RETURN 0
