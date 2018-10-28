/******************************************************************************
    
    Description:    Procedure to bulk import dev of election voter extracts.

    NOTE - SET NOT TO BUILD - MUST BE MANUALLY DEPLOYED

    TODO -->    SSDT doesn't want to build and deploy this procedure.
                I think this is becasue I am using SQL 2019 CTP features.

*******************************************************************************/
CREATE OR ALTER PROCEDURE [dbo].[ImportVoterCSV]
    @FileName VARCHAR(250),
    @ExtractDate Date
AS
    SELECT @FileName, @ExtractDate

    BEGIN TRY   
        BULK INSERT [dbo].[RawStateVoterImport]
        FROM 'D:\Statewide voter list PUBLIC  9-4-18.csv'
        with  (
	        FIRSTROW = 2,
	        FIELDTERMINATOR = ',',
	        ROWTERMINATOR = '\n',
	        FIELDQUOTE = '\"'
        );
    END TRY
    BEGIN CATCH
        PRINT 'BAD STUFF'
        RETURN 1
    END CATCH

    
RETURN 0