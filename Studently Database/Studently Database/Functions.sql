/****Function Creation****/

USE Studently
GO

/*Create Function SMS.StudentExists(@email varchar(100))
Returns Int
As
Begin

	If Exists( Select 1 From Studently.SMS.Student where Email = @email)
	Begin

		Return 1

	End

	return 0

END*/


/*Create Function SMS.TeacherExists(@email varchar(100))
Returns Int
As
Begin

	If Exists( Select 1 From Studently.SMS.Teacher where Email = @email)
	Begin

		Return 1

	End

	return 0

END*/


/*Create Function SMS.AssignmentExists(@email varchar(100), @title varchar(max), @course varchar(100))
Returns Int
As
Begin

	If Exists (Select 1 from SMS.Assignment where Email = @email and Title = @title and Course = @course)
	Begin
		
		return 1

	End

	return 0

End*/


/*Create Function SMS.DaysLeft(@email varchar(100), @srNo int)
Returns varchar(100)
As
Begin

	Declare  @dtEndDate AS datetime

	SELECT @dtEndDate = EndDate from SMS.CountdownClock where Email = @email and SrNo = @srNo

	if DATEDIFF(dd, GETDATE(), @dtEndDate) <= 0 and DATEDIFF(mm, GETDATE(), @dtEndDate) <= 0 and DATEDIFF(yyyy, GETDATE(), @dtEndDate) <=0
	Begin
			
		return '0,0,0'

	End
	Else
	Begin

		DECLARE @nMonth INT, @nYear INT, @mm INT, @dd INT, @getdd int
		DECLARE  @dtStartDate AS DATETIME

		SET @dtStartDate = GETDATE()
		SELECT @dtEndDate = EndDate from SMS.CountdownClock where Email = @email and SrNo = @srNo
		SET @nYear = DATEDIFF(yy, @dtStartDate, @dtEndDate)
		SET @mm = DATEDIFF(mm, @dtStartDate, @dtEndDate)
		SET @dd = DATEDIFF(dd, @dtStartDate, @dtEndDate)
		SET @nMonth = ABS(DATEDIFF(mm, DATEADD(yy, @nYear, @dtStartDate), @dtEndDate))
		SET @getdd = ABS(DATEDIFF(dd, DATEADD(mm, DATEDIFF(mm, DATEADD(yy, @nYear, @dtStartDate), @dtEndDate), DATEADD(yy, @nYear, @dtStartDate)), @dtEndDate))

		return Convert(varchar(4),@nYear) + ',' + Convert(varchar(2),@nMonth) + ',' + Convert(varchar(4),@getdd)
	
	End

	return '-1,-1,-1'

End*/


/*Create Function SMS.StudentBlocked(@email varchar(100), @studentEmail varchar(100))
Returns Int
As
Begin

	If Exists (Select 1 from SMS.BlockStudent where Email = @email and StudentEmail = @studentEmail)
	Begin

		return 1
	End

	return 0

End*/


/*Create Function SMS.ReminderExists(@email varchar(100), @title varchar(max), @reminderDate date, @reminderTime time)
Returns Int
As
Begin

	If Exists(Select 1 from SMS.Reminder where Email = @email and Title = @title and ReminderDate = @reminderDate and ReminderTime = @reminderTime)
	Begin
			
		return 1

	End
	
	return 0

End*/


/*Create Function SMS.CountdownClockExists(@email varchar(100), @title varchar(max), @endDate date)
Returns int
As
Begin

	If Exists(Select 1 from SMS.CountdownClock where Email = @email and Title = @title and EndDate = @endDate)
	Begin

		return 1

	End

	return 0

End*/


/*Create Function SMS.PlannerExists(@email varchar(100), @event varchar(max), @dayOfWeek int, @eventTime varchar(100))
Returns int
As
Begin

	If Exists(Select 1 from SMS.Planner where Email = @email and Event = @event and DayOfWeek = @dayOfWeek and DateRange = @eventTime)
	Begin

		return 1

	End

	return 0

End*/


/*Create Function SMS.TimeSpentLearningExists(@email varchar(100), @date date)
Returns Int
As
Begin

	If Exists(Select 1 from SMS.TimeSpentLearning where Email = @email and "Date" = @date)
	Begin

		return 1

	End

	return 0

End*/

/*Create Function SMS.TaskExists(@task varchar(max), @email varchar(100))
Returns Int
As
Begin

	If Exists( Select 1 From SMS.ToDoList where Task = @task and Email = @email)
	Begin

		Return 1

	End

	return 0

END*/


/****Function Deletion****/

Drop Function SMS.StudentExists;
GO
Drop Function SMS.TeacherExists;
GO
Drop Function SMS.AssignmentExists;
GO
Drop Function SMS.DaysLeft;
GO
Drop Function SMS.StudentBlocked;
GO
Drop Function SMS.ReminderExists
GO
Drop Function SMS.CountdownClockExists
GO
Drop Function SMS.PlannerExists
GO
Drop Function SMS.TimeSpentLearningExists
GO
Drop Function SMS.TaskExists
GO