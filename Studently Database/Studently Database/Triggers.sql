/****Triggers Creation****/


/*Create Trigger SMS.Primary_Key_CountdownClock
On SMS.CountdownClock Instead of Insert
As
Begin

	Set Nocount On

	Declare @count int, @email varchar(100)

	Select @email = Email from inserted

	Select @count  = Max(SrNo) from SMS.CountdownClock where Email = @email

	If @count is NULL
	Begin

		set @count = 0
	End

	Set @count = @count + 1

	Insert into SMS.CountdownClock (SrNo, Email, Title, EndDate) Select @count, @email, Title, EndDate from inserted

End*/


/*Create Trigger SMS.Primary_Key_Announcement
On SMS.Announcement Instead of Insert
As
Begin

	Set Nocount on

	Declare @count int, @email varchar(100)

	Select @email = Email from inserted

	Select @count = Max(SrNo) from SMS.Announcement where Email = @email

	If @count is NULL
	Begin

		set @count = 0
	End

	Set @count = @count + 1

	Insert into SMS.Announcement (SrNo, Email, Content, PostDate, PostTime) Select @count, Email, Content, PostDate, PostTime from inserted

End*/


/*Create Trigger SMS.Primary_Key_Reminder
On SMS.Reminder Instead of Insert
As
Begin

	Set NoCount On

	Declare @count int, @email varchar(100)

	Select @email = Email from inserted

	Select @count = max(SrNo) from SMS.Reminder where Email = @email

	If @count is NULL
	Begin

		set @count = 0
	End

	Set @count = @count + 1

	Insert into SMS.Reminder (SrNo, Email, Title, ReminderDate, ReminderTime) Select @count, Email, Title, ReminderDate, ReminderTime from inserted

End*/


/*Create Trigger SMS.Primary_Key_Planner
On SMS.Planner Instead of Insert
As
Begin

	Set NoCount on

	Declare @count int, @email varchar(100)

	Select @email= Email from Inserted

	Select @count = max(SrNo) from SMS.Planner where Email = @email

	If @count is NULL
	Begin

		set @count = 0
	End

	Set @count = @count + 1

	Insert into SMS.Planner (SrNo, Email, "Event", DayOfWeek, DateRange) Select @count, Email, "Event", DayOfWeek, DateRange from inserted

End*/

/*Create Trigger SMS.Primary_Key_TimeSpentLearning
on SMS.TimeSpentLearning Instead of Insert
As
Begin

	Set NoCount on

	Declare @count int, @email varchar(100)

	Select @email = Email from inserted

	Select @count = max(SrNo) from SMS.TimeSpentLearning where Email = @email

	If @count is NULL
	Begin

		set @count = 0

	End

	set @count = @count + 1

	Insert into SMS.TimeSpentLearning (SrNo, Email, HoursSpent, "Date") Select @count, Email, HoursSpent, "Date" from inserted

End*/


/****Triggers Deletion****/

Drop Trigger SMS.Primary_Key_ToDoList
GO
Drop Trigger SMS.Primary_Key_Assignment
GO
Drop Trigger SMS.Primary_Key_CountdownClock
GO
Drop Trigger SMS.Primary_Key_Announcement
GO
Drop Trigger SMS.Primary_Key_Reminder
GO
Drop Trigger SMS.Primary_Key_Planner
GO
Drop Trigger SMS.Primary_Key_TimeSpentLearning
GO