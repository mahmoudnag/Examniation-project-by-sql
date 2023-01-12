

--- Views 
	--- Student Views manually created by Instructor
create view Student4 as
select ID, Name, Grade, course_id
from Student
where ID = 4

select * from Student4

--- Student 1
create view Student1 as
select ID, Name, Grade, course_id
from Student
where ID = 1

--- Student 2
create view Student2 as
select ID, Name, Grade, course_id
from Student
where ID = 2

--- Student 3
create view Student3 as
select ID, Name, Grade, course_id
from Student
where ID = 3

--- Student 4
create view Student4 as
select ID, Name, Grade, course_id
from Student
where ID = 4

--------------------------------

	--- Instructor Views manually created by Manager
	---Instructor 1
create view Instructor1 as
select *
from Instructor
where ID = 1

	--- Instructor 2
create view Instructor2 as
select *
from Instructor
where ID = 2

	--- Instructor 3
create view Instructor3 as
select *
from Instructor
where ID = 3

	--- Instructor 4
create view Instructor4 as
select *
from Instructor
where ID = 4

	--- Manager Views manually created by Server Admin
create view DepartmentV as
select *
from Department

create view BranchV as
select *
from Branch

drop view CourseV as
select *
from Course

create view ExamV as
select *
from Exams

create view InstructorV as
select *
from Instructor

create view QuestionV as
select *
from question

create view ResultV as
select *
from result

create view StudentV as
select *
from Student

create view TrackV as
select *
from Track

	




select * from Instructor

/*create trigger TR_StudentView
on dbo.student
as
begin
declare @stud_id int
set @stud_id = (SELECT TOP 1 ID FROM Student ORDER BY ID DESC)
create view @stud_id as
select ID, Name, Grade, course_id
from Student
where ID = @stud_id
end
*/


select * from Student