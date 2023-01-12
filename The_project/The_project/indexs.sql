
--- Non-Clustered Indexes for Database

create nonclustered index IX_Branch_Name
on dbo.Branch (Name)

create nonclustered index IX_Course_Name
on dbo.Course (Name)

create nonclustered index IX_Department_Name
on dbo.Department (Name)

create nonclustered index IX_Dept_Manager_Name
on dbo.Dept_Manager (Name)

create nonclustered index IX_Instructor_Name
on dbo.Instructor (Name)

create nonclustered index IX_Manager_Name
on dbo.Manager (Name)

create nonclustered index IX_Question_CourseID
on dbo.question (course_id)

create nonclustered index IX_Student_Name
on dbo.Student (Name)

create nonclustered index IX_Track_Name
on dbo.Track (Name)

--fast perforamnce select Name  from Student where Name like 'a%';