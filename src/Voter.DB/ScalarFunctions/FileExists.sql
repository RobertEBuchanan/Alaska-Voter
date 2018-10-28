/******************************************************************************
    
    Description:    Check if file exists.  For use prior to bulk loading data

    "Stolen" from https://stackoverflow.com/questions/11740000/check-for-file-exists-or-not-in-sql-server

*******************************************************************************/
CREATE FUNCTION dbo.FileExists(@path varchar(512))
RETURNS BIT
AS
BEGIN
     DECLARE @result INT
     EXEC master.dbo.xp_fileexist @path, @result OUTPUT
     RETURN cast(@result as bit)
END;
GO