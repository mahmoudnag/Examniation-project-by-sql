
alter  proc ShowExam(@st_id int,@course_id int)
as
  begin
  SELECT top 1 Start_Time FROM    Exams 
		 where Course_ID=@course_id and St_ID=@st_id;
        SELECT e.St_ID, q.content,q.choises ,e.Course_ID,e.q_id
        FROM   question as q join Exams as e  on
		q.q_id=e.q_id where e.Course_ID=@course_id and e.St_ID=@st_id;
		  SELECT top 1( End_Time)
        FROM    Exams 
		 where Course_ID=@course_id and St_ID=@st_id ;
  end
  ----------enter your id qnd course id to show exam
  exec ShowExam 1,2;


  -----------store all resulat

 GO
create proc store_result(@student_id int , @co_id int)
as
begin
declare @sum int ;
set @sum =(select SUM(mark) from store_question_result where st_id=@student_id and  course_id =@co_id );
UPDATE Student
SET Grade =@sum where ID=@student_id and  course_id =@co_id
end
exec store_result 1,1

GO

------------------proc to answer the exam
alter proc mark_every_question (@answer1 nvarchar(20)  , @q_id int ,@s_id int ,@crse_id int ) --  question id  and his answer and student id and cource id 
as
begin 
declare @grade int =0; ---- will be return finally Grade 
declare  @realanswer nvarchar(max); -- realanswer

set @realanswer= (select  answer from question where q_id =@q_id and course_id = @crse_id) -- compare berween student answer and reak answer

if ( @answer1= @realanswer)
 
 insert into store_question_result values (@s_id,@q_id,1,@crse_id)
 else 
 insert into store_question_result values (@s_id,@q_id,0,@crse_id)

exec store_result @s_id,@crse_id

end
go
--proc to show your student result
create proc showresult ( @s_id int)
as
begin
select ID, Name, Grade from Student where ID = @s_id
end



 ----------answer the exam
exec mark_every_question 'prog language',1,1,1


----enter student id to show your result
exec showresult 1





