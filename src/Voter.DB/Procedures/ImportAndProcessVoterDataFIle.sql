/******************************************************************************
    
    Description:    Master stored procedure for importing voter data files.

*******************************************************************************/
CREATE PROCEDURE [dbo].[ImportAndProcessVoterDataFile]
    @FileName VARCHAR(250) = 'Missing',
    @FileDate DATETIME
AS
    BEGIN

       EXEC dbo.LogDataImport @FileName, @FileDate, "Starting Import"

        BEGIN TRY
            IF (dbo.FileExists(@FileName) = 1)
                BEGIN

                    EXEC dbo.ImportVoterCSV @FileName 

                    EXEC dbo.LogDataImport @FileName, @FileDate, "ImportVoterCSV -> Finished"

                    EXEC dbo.ParseRawToElections @FileDate

                    EXEC dbo.LogDataImport @FileName, @FileDate, "ParseRawToElections -> Finished"

                    EXEC [dbo].[ParseRawToVoters]

                    EXEC dbo.LogDataImport @FileName, @FileDate, "ParseRawToVoters -> Finished"

                    EXEC [dbo].[ParseRawToVoterElections]
        
                    EXEC dbo.LogDataImport @FileName, @FileDate, "Finished Import"
                END
            ELSE
                BEGIN
                    DECLARE @msg AS VARCHAR(250) = 'File Read Failure for ' + @FileName
                    EXEC dbo.LogDataImport @FileName, @FileDate,@msg
                    RETURN 2
                END

        END TRY
        BEGIN CATCH
            PRINT 'oops!' 
            
            DECLARE @err VARCHAR(100) = --'ERROR: '     + ERROR_MESSAGE() + ' // ' +  
            'PROCEDURE: ' + ERROR_PROCEDURE()
            
            EXEC dbo.LogDataImport @FileName, @FileDate, @err
            RETURN 1
        END CATCH

    END

RETURN 0
