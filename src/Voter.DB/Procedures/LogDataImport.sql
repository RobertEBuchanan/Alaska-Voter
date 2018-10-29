/******************************************************************************
    
    Description:    STUB HEADER

*******************************************************************************/
CREATE PROCEDURE [dbo].[LogDataImport]
    @FileName VARCHAR(250) = 'Missing',
    @FileDate DATETIME,
    @Note VARCHAR(100) = 'Missing'
AS
    INSERT INTO dbo.DataImports
    (
        FileName,
        FileDate,
        ImportDate,
        Note
    )
    VALUES
    (
        @FileName, -- FileName - varchar
        @FileDate, -- FileDate - date
        GETDATE(), -- ImportDate - datetime
        @Note
    )
RETURN 0
