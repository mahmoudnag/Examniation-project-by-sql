--- Students' Info
	--- Add Student
GO
CREATE PROC PROC_AddStudent @ID int, @name nvarchar(35), @track nvarchar(100), @branch nvarchar(20), @intake int, @grade char, @Mgr_ID int
AS
BEGIN
	BEGIN TRY
		IF(@ID = (SELECT ID FROM Course WHERE ID NOT IN (ID)))
		BEGIN
			PRINT 'Duplicate ID Error'
		END
		ELSE
		BEGIN
			INSERT INTO Student
			VALUES (@ID , @name , @track , @branch , @intake , @grade , @Mgr_ID)
			PRINT 'Student Added Successfully'
		END
	END TRY
	BEGIN CATCH
		DECLARE @LAStID int
		SELECT @LAStID = (SELECT TOP 1 ID AS 'LASt Student ID' FROM Student ORDER BY ID DESC)
		PRINT 'Duplicate ID Error, LASt Student ID Is: ' 
		PRINT @LAStID
	END CATCH
END
GO
EXEC PROC_AddStudent 1,'Islam','.Net','Minya',43,A,3

--- DELETE Student
GO
CREATE PROC PROC_DELETEStudent @ID int
AS
BEGIN
	BEGIN TRY
		IF(@ID = (SELECT ID FROM Student WHERE ID = @ID))
		BEGIN
			DELETE FROM Student WHERE @ID = ID
			PRINT 'Student DELETEd Successfully'
		END
		ELSE
		BEGIN
			PRINT 'No Such Student ID Exists to be DELETED'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS 'ERROR'
	END CATCH
END
GO
EXEC PROC_DELETEStudent 2
GO 


	--- UPDATE Student 
CREATE PROC PROC_UPDATEStudent @ID int, @name nvarchar(35), @track nvarchar(20), @branch nvarchar(20), @intake int, @grade char, @Mgr_ID int
AS
BEGIN
	BEGIN TRY
		IF(@ID = (SELECT ID FROM Student WHERE ID NOT IN (ID)))
		BEGIN
			PRINT 'Duplicate ID Error'
		END
		ELSE
		BEGIN
			UPDATE Student
			SET  ID=@ID ,  Name=@name ,  Track=@track , Branch=@branch ,  Intake=@intake ,  Grade=@grade , Manager_ID=@Mgr_ID
			WHERE @ID = ID
			PRINT 'Student UPDATEd Successfully'
		END
	END TRY
	BEGIN CATCH
		PRINT 'Error'
	END CATCH
END
EXEC PROC_UPDATEStudent 1,'Randa','Dot Net','Minia',43,'B',1
SELECT * FROM Student


