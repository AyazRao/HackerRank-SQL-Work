/*
Problem: Print Prime Numbers (HackerRank)
Language: MS SQL Server (using T-SQL variables and loops)

Objective: Write a query (or T-SQL script) to print all prime numbers 
less than or equal to 1000, using the ampersand (&) character as a separator.
*/
-- The core code uses T-SQL control-of-flow statements (WHILE loops and IF blocks).

SET NOCOUNT ON;

DECLARE @Counter INT
DECLARE @New_Counter VARCHAR(1000)
DECLARE @i INT
DECLARE @j INT 
SET @Counter=2
SET @New_Counter=''

WHILE (@Counter <= 1000)
BEGIN
SET @i=1
SET @j=0 
        WHILE (@i <= round(@Counter/2,0))
    BEGIN
        IF (@i<>1 and @counter%@i=0)
        SET @j = @j + 1
    SET @i  = @i  + 1
    END
        IF (@j=0)
        BEGIN
            SET @New_Counter=@New_Counter+'&'+CONVERT(VARCHAR,@Counter)
        END            
    SET @Counter  = @Counter  + 1
END
--PRINT @New_Counter
PRINT SUBSTRING(@New_Counter,2,LEN(@New_Counter))
go