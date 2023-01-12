--- Courses
	--- Add Course PROCedure
	GO
CREATE PROC PROC_AddCourse @ID int, @name nvarchar(35), @desc nvarchar(100), @minD int = 20, @maxD int = 40, @ins_ID int
AS
BEGIN
	BEGIN TRY
		IF(@ID = (SELECT ID FROM Course WHERE ID NOT IN (ID)))
		BEGIN
			PRINT 'Duplicate ID Error'
		END
		ELSE
		BEGIN
			INSERT INTO Course
			VALUES(@ID, @name, @desc, @minD, @maxD, @ins_ID)
			PRINT 'Course Added Successfully'
		END
	END TRY
	BEGIN CATCH
		SELECT TOP 1 ID AS 'LASt Course ID' FROM Course ORDER BY ID DESC
	END CATCH
END
GO
EXEC PROC_AddCourse 21, 'Mysql-xampp', ' DATABASE lanaguge', 21, 40, 3
GO
select* from Course
--- DELETE Course
GO
CREATE PROC PROC_DELETECourse @ID int
AS
BEGIN
	BEGIN TRY
		IF(@ID = (SELECT ID FROM Course WHERE ID = @ID))
		BEGIN
			DELETE FROM Course WHERE @ID = ID
			PRINT 'Course DELETEd Successfully'
		END
		ELSE
		BEGIN
			PRINT 'No Such Course ID Exists to be DELETED'
		END
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS 'ERROR'
	END CATCH
END
GO
EXEC PROC_DELETECourse 22

	--- UPDATE Course

CREATE PROC PROC_UPDATECourse @ID int, @name nvarchar(35), @desc nvarchar(100), @minD int = 20, @maxD int = 40, @ins_ID int
AS
BEGIN
	BEGIN TRY
		IF(@ID = (SELECT ID FROM Course WHERE ID NOT IN (ID)))
		BEGIN
			PRINT 'Duplicate ID Error'
		END
		ELSE
		BEGIN
			UPDATE Course
			SET ID = @ID,Name = @name, Description = @desc, Min_Degree = @minD, Max_Degree = @maxD, Instructor_ID = @ins_ID
			WHERE @ID = ID
			PRINT 'Course UPDATEd Successfully'
		END
	END TRY
	BEGIN CATCH
		PRINT 'Error'
	END CATCH
END
EXEC PROC_UPDATECourse 21, 'sql', 'language database', 20 , 40, 2

SELECT * FROM Course







