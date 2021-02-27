/****Procedure Creation****/
Use Studently
GO

/*Create Procedure SMS.Insert_Student(@email varchar(100), @fname varchar(20), @lname varchar(20), @password varchar(max), @university varchar(max))
As
Begin
	
	SET NOCOUNT ON

	Insert into Studently.SMS.Student (Email, Fname, Lname, "Password", University, ProfileStatus) Values (@email, @fname, @lname, @password, @university, 1)

	Return

End*/


/*Create Procedure SMS.Insert_Teacher(@email varchar(100), @fname varchar(20), @lname varchar(20), @password varchar(max), @university varchar(max), @office varchar(100), @course varchar(100))
As
Begin
		
		SET NOCOUNT ON

		Insert into Studently.SMS.Teacher(Email, Fname, Lname, "Password", University, Office, Course) Values (@email, @fname, @lname, @password, @university, @office, @course)

	Return

End*/


/*Create Procedure SMS.Insert_ToDoList(@email varchar(100), @task varchar(max))
As
Begin

	SET NOCOUNT ON

	Insert into SMS.ToDoList(Email, Task, TimeStamp) Values (@email, @task, GETDATE())

End*/


/*Create Procedure SMS.Delete_ToDoList(@email varchar(100), @task varchar(max))
As
Begin
	 
	 Set NoCount On

	 Delete from SMS.ToDoList Where Email = @email and Task = @task

End*/


/*Create Procedure SMS.Delete_PastTasks(@email varchar(100))
As
Begin

	Set NoCount On

	Delete from SMS.ToDoList where Email = @email and DATEDIFF(day, "TimeStamp", GETDATE()) = 1

End*/


/*Create Procedure SMS.Insert_Assignment(@email varchar(100), @Title varchar(max), @Course varchar(100) ,@SubmissionDate Date, @SubmissionTime time, @Complete int)
As
Begin
	
	Set NoCount On

	Insert into SMS.Assignment(Email, Title, Course, SubmissionDate, SubmissionTime, Complete, Priority) Values (@email, @Title, @Course, @SubmissionDate, @SubmissionTime, @Complete, 0)

End*/


/*Create Procedure SMS.Delete_Assignment(@email varchar(100), @title varchar(max), @course varchar(100))
As
Begin

	Set NoCount On

	Delete from SMS.Assignment where Email = @email and Title = @title and Course = @course

End*/


/*Create Procedure SMS.Insert_CountdownClock(@email varchar(100), @title varchar(max), @endDate date)
As
Begin

	Set NoCount On

	If Exists(Select 1 from SMS.CountdownClock where Email = @email and Title = @title)
	Begin

		Declare @SrNo int

		Select @SrNo = SrNo from SMS.CountdownClock where Email = @email and Title = @title

		Update SMS.CountdownClock Set EndDate = @endDate where Email = @email and Title = @title and SrNo = @SrNo

	End
	Else
	Begin

		Insert into SMS.CountdownClock(Email, Title, EndDate) Values (@email, @title, @endDate)

	End

End*/


/*Create Procedure SMS.Delete_CountdownClock(@email varchar(100), @srno int)
As
Begin

	Set NoCount On

	Delete from SMS.CountdownClock where Email = @email and SrNo = @srno

End*/


/*Create Procedure SMS.Insert_BlockStudent(@email varchar(100), @studentEmail varchar(100))
As
Begin

	Set NoCount On

	Insert into SMS.BlockStudent (Email, StudentEmail) Values (@email, @studentEmail)

End*/


/*Create Procedure SMS.Delete_BlockStudent(@email varchar(100), @studentEmail varchar(100))
As
Begin

	Set NoCount On

	Delete from SMS.BlockStudent where Email = @email and StudentEmail = @studentEmail

End*/


/*Create Procedure SMS.Insert_Announcement(@email varchar(100), @content varchar(max), @postDate date, @postTime varchar(100))
As
Begin

	Set NoCount On

	Insert into SMS.Announcement (Email, Content, PostDate, PostTime) Values (@email, @content, @postDate, @postTime)

End*/


/*Create Procedure SMS.Delete_Announcement(@email varchar(100), @content varchar(max), @postDate date, @postTime varchar(100))
As
Begin

	Set Nocount on

	Delete from SMS.Announcement where Email = @email and Content = @content and PostDate = @postDate and PostTime = @postTime

End*/


/*Create Procedure SMS.Insert_Reminder(@email varchar(100), @title varchar(100), @reminderDate date, @reminderTime time)
As
Begin

	Set nocount on

	Insert into SMS.Reminder (Email, Title, ReminderDate, ReminderTime) Values (@email, @title, @reminderDate, @reminderTime)

End*/


/*Create Procedure SMS.Delete_Reminder(@email varchar(100), @title varchar(100), @reminderDate date, @reminderTime time)
As
Begin

	Set nocount on

	Delete from SMS.Reminder where Email = @email and Title = @title and ReminderDate = @reminderDate and ReminderTime = @reminderTime

End*/


/*Create Procedure SMS.Insert_Planner (@email varchar(100), @event varchar(max), @dayOfWeek int, @dateRange varchar(100))
As
Begin

	Set Nocount on

	Insert into SMS.Planner (Email, "Event", DayOfWeek, DateRange) Values (@email, @event, @dayOfWeek, @dateRange)

End*/


/*Create Procedure SMS.Delete_Planner (@email varchar(100), @event varchar(max), @dayOfWeek int, @dateRange varchar(100))
As
Begin

	Set Nocount on

	Delete from SMS.Planner where Email = @email and "Event" = @event and DayOfWeek = @dayOfWeek and DateRange = @dateRange

End*/


/*Create Procedure SMS.Insert_TimeSpentLearning (@email varchar(100), @hours decimal(12,10))
As
Begin

	Set NoCount on

	Insert into SMS.TimeSpentLearning (Email, HoursSpent, "Date") Values (@email, @hours, GETDATE())

End*/


/*Create Procedure SMS.Update_TimeSpentLearning(@email varchar(100), @hours decimal(12,10), @date date)
As
Begin

	SET NOCOUNT ON

	UPDATE SMS.TimeSpentLearning SET HoursSpent = @hours where Email = @email and "Date" = @date

End*/


/*Create Procedure SMS.Update_AssignmentCompletion(@email varchar(100), @title varchar(max), @course varchar(100) ,@submissionDate date, @submissionTime time, @complete int)
As
Begin
	
	Set NoCount on

	Update SMS.Assignment Set Complete = @complete Where Email = @email and Title = @title and Course = @course and SubmissionDate = @submissionDate and SubmissionTime = @submissionTime

End*/


/*Create Procedure SMS.Update_AssignmentPriority(@email varchar(100), @title varchar(max), @course varchar(100), @submissionDate date, @submisionTime time, @priority int)
As
Begin
	
	Set NoCount on

	Update SMS.Assignment Set "Priority" = @priority Where Email = @email and Title = @title and Course = @course and SubmissionDate = @submissionDate and SubmissionTime = @submisionTime

End*/


/****Procedure Deletion****/
Drop Procedure SMS.Insert_Student;
GO
Drop Procedure SMS.Insert_Teacher;
GO
Drop Procedure SMS.Insert_ToDoList;
GO
Drop Procedure SMS.Delete_ToDoList;
GO
Drop Procedure SMS.Delete_PastTasks;
GO
Drop Procedure SMS.Insert_Assignment;
GO
Drop Procedure SMS.Delete_Assignment;
GO
Drop Procedure SMS.Insert_CountdownClock;
GO
Drop Procedure SMS.Delete_CountdownClock;
GO
Drop Procedure SMS.Insert_BlockStudent;
GO
Drop Procedure SMS.Delete_BlockStudent;
GO
Drop Procedure SMS.Insert_Announcement;
GO
Drop Procedure SMS.Delete_Announcement
GO
Drop Procedure SMS.Insert_Reminder;
GO
Drop Procedure SMS.Delete_Reminder;
GO
Drop Procedure SMS.Insert_Planner;
GO
Drop Procedure SMS.Delete_Planner;
GO
Drop Procedure SMS.Insert_TimeSpentLearning
GO
Drop Procedure SMS.Update_TimeSpentLearning
GO
Drop Procedure SMS.Update_AssignmentCompletion
GO
Drop Procedure SMS.Update_AssignmentPriority
GO