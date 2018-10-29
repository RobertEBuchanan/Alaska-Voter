/******************************************************************************
    
    Description:    Master stored procedure for importing voter data files.

*******************************************************************************/
CREATE PROCEDURE [dbo].[ImportAndProcessVoterDataFile]
    @FileName VARCHAR(250) = 'Missing',
    @FileDate DATETIME
AS
    BEGIN
        SELECT @FileName, @FileDate

        EXEC dbo.LogDataImport @FileName, @FileDate, "Start Import"

        --EXEC dbo.ImportVoterCSV @FileName 
        
    END

RETURN 0
