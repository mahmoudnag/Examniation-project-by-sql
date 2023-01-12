---Manager Permissions
	--- Instructor 
	--- ADD Instructor PROCedure
CREATE PROC PROC_AddInstructor @ID int, @name nvarchar(35), @Mgr_ID int
AS
BEGIN
	BEGIN TRY
		IF(@ID = (SELECT ID FROM Instructor WHERE ID NOT IN (ID)))
		BEGIN
			PRINT 'Duplicate ID Error'
		END
		ELSE
		BEGIN
			INSERT INTO Instructor
			VALUES(@ID,@name,@Mgr_ID)
		END
	END TRY
	BEGIN CATCH
		DECLARE @LAStID int
		SELECT @LAStID = (SELECT TOP 1 ID AS 'LASt Instructor ID' FROM Instructor ORDER BY ID DESC)
		PRINT 'Duplicate ID Error, lASt Instructor ID is: '
		PRINT @LAStID
	END CATCH
END

SELECT * FROM Instructor
EXEC PROC_AddInstructor 7, 'Haidy', 1

--- DELETE Instructor PROCedure
GO
CREATE PROC PROC_DELETEInstructor @ID int
AS
BEGIN
	BEGIN TRY
		IF(@ID = (SELECT ID FROM Instructor WHERE ID = @ID))
		BEGIN
			DELETE FROM Instructor WHERE  ID=@ID
		END
		ELSE
		BEGIN
			PRINT 'No Such ID Exists to be DELETED'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS 'ERROR'
	END CATCH
END

GO

EXEC PROC_DELETEInstructor 7





	--- UPDATE Instructor PROCedure 
	Go
CREATE PROC PROC_UPDATEInstructor @ID int, @name nvarchar(35), @Mgr_ID int
AS
BEGIN
	BEGIN TRY
		IF(@ID = (SELECT ID FROM Instructor WHERE ID NOT IN (ID)))
		BEGIN
			PRINT 'Duplicate ID Error'
		END
	ELSE
	BEGIN
		UPDATE Instructor
		SET ID = @ID, Name = @name , Manager_ID = @Mgr_ID
		WHERE @ID = ID
	END
	END TRY
	BEGIN CATCH
		PRINT 'Error'
	END CATCH
END

GO
EXEC PROC_UPDATEInstructor 6, 'Mahmoud',1

