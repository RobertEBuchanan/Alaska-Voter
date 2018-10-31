/******************************************************************************
    
    Description:    Master stored procedure for importing voter data files.

*******************************************************************************/
CREATE PROCEDURE [dbo].[ImportAndProcessVoterDataFile]
    @FileName VARCHAR(250) = 'Missing',
    @FileDate DATETIME
AS
    BEGIN

        BEGIN TRY

            EXEC dbo.LogDataImport @FileName, @FileDate, "Starting Import"

            EXEC dbo.ImportVoterCSV @FileName 

            EXEC dbo.ParseRawToElections @FileDate

            EXEC [dbo].[ParseRawToVoters]

            EXEC [dbo].[ParseRawToVoterElections]
        
            EXEC dbo.LogDataImport @FileName, @FileDate, "Finished Import"

        END TRY
        BEGIN CATCH
            PRINT 'oops!' 
            
            DECLARE @msg VARCHAR(100) = --'ERROR: '     + ERROR_MESSAGE() + ' // ' +  
            'PROCEDURE: ' + ERROR_PROCEDURE()
            
            EXEC dbo.LogDataImport @FileName, @FileDate, @msg
            RETURN 1
        END CATCH

    END

RETURN 0
