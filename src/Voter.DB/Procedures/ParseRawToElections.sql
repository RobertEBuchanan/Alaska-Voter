/******************************************************************************
    
    Description:    Pulls and adds new elections...

*******************************************************************************/
CREATE PROCEDURE [dbo].[ParseRawToElections]
   @SourceDate AS DATETIME2
AS
    ;WITH 
    new_elections_cte AS
    (
        SELECT DISTINCT 
            VoteYear, 
            VoteElection
        FROM dbo.RawVotes 

        EXCEPT 

        SELECT DISTINCT 
            VoteYear, 
            VoteElection
        FROM dbo.Election 
    )
	INSERT INTO dbo.Election 
       SELECT 
            VoteYear,
            VoteElection,
			NULL,
            @SourceDate
        FROM new_elections_cte

RETURN 0
