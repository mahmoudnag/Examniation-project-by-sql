
--procure to instructor add new question;

create proc InstructorAddQuetions(@q_id int,@q_name nvarchar(50)
,@content nvarchar(max) ,
@choises nvarchar(max),
@answer nvarchar(max)
,@course_id int ,@inst_id int)
as
begin 
	insert into question values(@q_id ,@q_name ,@content ,@choises,@answer,@course_id  ,@inst_id );
end

exec InstructorAddQuetions 13, 'MSQ','what is Laravel#','gggg','web programing',1,1;

GO
--procure insutrctor to update a question;
create proc instructorUPDATE (@content nvarchar(max)
, @choises nvarchar(max),@answer nvarchar(max),
@q_id int,@course_id int ,@inst_id int)
as
begin 
	update question set content=@content, choises=@choises, answer=@answer
	where q_id=@q_id  and course_id=@course_id and inst_id=@inst_id;


end
GO


exec InstructorAddQuetions 12, 'MSQ','what is c#','gggg','OOP programing',1,1;

--procure  instructor to delete question;

create proc instructorDELETEQUESTIONS (@q_id int)
as
begin 
	delete from question
	where q_id=@q_id ;

end
exec instructorDELETEQUESTIONS 12;
select * from question;

GO
 
 alter proc makeExam(@insertnumberid int,@Track_name nvarchar(50)
,@branch nvarchar(50) ,
@corrective bit,
@type nvarchar(50)
,@start_time smalldatetime,
@end_time smalldatetime,
@year int,
@st_id int,
@ins_id int,
@course_id int,
@question_id int,
@exam_id int)
as
begin 
	insert into Exams values(
	@insertnumberid ,@Track_name ,@branch 
	,@corrective,@type,@start_time,@end_time
	 ,@year, @st_id ,@ins_id ,@course_id,@question_id,@exam_id);
end
------insrtuctor insert Exam
exec makeExam 16,'AI','Alex',1,'msq','2023-07-24 06:30:50.000',
'2023-07-24 09:30:50.000',2022,2,1,1,4,1










		
		











