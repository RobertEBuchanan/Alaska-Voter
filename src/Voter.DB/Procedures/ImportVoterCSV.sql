/******************************************************************************
    
    Description:    Procedure to bulk import dev of election voter extracts.

    NOTE -->    SSDT didn't want to build and deploy this procedure.
                I think this is becasue I am using a SQL 2017/2019 CTP feature (Format keyword)
                Put bulk insert into dynamic SQL.

    TODO -->    Better error handling... (Output param?)

    Smoke Tests

    DECLARE	@return_value int

    EXEC	@return_value = [dbo].[ImportVoterCSV]
		    @FileName = 'D:\Statewide voter list PUBLIC  9-4-18.csv'		

    SELECT	'Return Value' = @return_value

GO

*******************************************************************************/
CREATE PROCEDURE [dbo].[ImportVoterCSV]
    @FileName VARCHAR(250)
AS
    BEGIN TRY   
		IF (dbo.FileExists(@FileName) = 1)
			BEGIN
                TRUNCATE TABLE [dbo].[RawStateVoterImport]

                -- 'D:\Statewide voter list PUBLIC  9-4-18.csv'
                DECLARE @SQL_BULK VARCHAR(MAX) = 
                        'BULK INSERT [dbo].[RawStateVoterImport]
				            FROM ''' + @FileName + '''                      
				            with (
					            FORMAT =''CSV'',
					            FIRSTROW = 2,
					            FIELDTERMINATOR = '','',
					            ROWTERMINATOR = ''\n''
				            );'
              
                 EXEC (@SQL_BULK)
			END
		ELSE
			BEGIN 
				PRINT 'FILE NOT FOUND ' + @FileName
				RETURN 2
			END
    END TRY
    BEGIN CATCH
        PRINT 'BAD STUFF'
        SELECT  
			ERROR_NUMBER() AS ErrorNumber  
			,ERROR_SEVERITY() AS ErrorSeverity  
			,ERROR_STATE() AS ErrorState  
			,ERROR_PROCEDURE() AS ErrorProcedure  
			,ERROR_LINE() AS ErrorLine  
			,ERROR_MESSAGE() AS ErrorMessage;  
		RETURN 1
    END CATCH

    
RETURN 0