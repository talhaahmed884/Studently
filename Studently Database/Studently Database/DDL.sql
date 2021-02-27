/****Schema Creation****/

Use Studently
GO
Create Schema SMS
GO


/****Table Creation****/

CREATE TABLE Studently.SMS.[Student] (
  [Email] varchar(100) PRIMARY KEY,
  [Fname] varchar(20) NOT NULL,
  [Lname] varchar(20) NOT NULL,
  [Password] varchar(max) NOT NULL,
  [University] varchar(max) NOT NULL,
  [ProfileStatus] bit NOT NULL
)
GO


CREATE TABLE Studently.SMS.[Teacher] (
  [Email] varchar(100) PRIMARY KEY,
  [Fname] varchar(20) NOT NULL,
  [Lname] varchar(20) NOT NULL,
  [Password] varchar(max) NOT NULL,
  [University] varchar(max) NOT NULL,
  [Office] varchar(100) NOT NULL,
  [Course] varchar(100) NOT NULL
)
GO


CREATE TABLE Studently.SMS.[ToDoList] (
  [SrNo] int Identity(1,1),
  [Email] varchar(100),
  [Task] varchar(max) NOT NULL,
  [TimeStamp] datetime NOT NULL,
  PRIMARY KEY ([SrNo], [Email])
)
GO


CREATE TABLE Studently.SMS.[Assignment](
  [SrNo] int Identity(1,1),
  [Email] varchar(100),
  [Title] varchar(max) not null,
  [Course] varchar(100),
  [SubmissionDate] Date not null,
  [SubmissionTime] Time not null,
  [Complete] int not null,
  [Priority] int not null
  PRIMARY KEY ([SrNO], [Email])
)
GO


CREATE TABLE SMS.[CountdownClock](
  [SrNo] int,
  [Email] varchar(100),
  Title varchar(max),
  [EndDate] date not null
  PRIMARY KEY ([SrNo], [Email])
)
GO


CREATE TABLE SMS.[BlockStudent](
  [Email] varchar(100),
  [StudentEmail] varchar(100),
  PRIMARY KEY ([Email], [StudentEmail])
)
GO


Create Table SMS.[Announcement](
  [SrNo] int,
  [Email] varchar(100),
  [Content] varchar(max) not null,
  [PostDate] date not null,
  [PostTime] varchar(100) not null,
  PRIMARY KEY ([SrNo], [Email])
)
GO


CREATE TABLE SMS.[Reminder](
  [SrNo] int,
  [Email] varchar(100),
  [Title] varchar(max) not null,
  [ReminderDate] date not null,
  [ReminderTime] time not null,
  PRIMARY KEY ([SrNo], [Email])
)
GO


CREATE TABLE SMS.[Planner](
  [SrNo] int, 
  [Email] varchar(100),
  [Event] varchar(max) not null,
  [DayOfWeek] int not null,
  [DateRange] varchar(100) not null
  PRIMARY KEY ([SrNo], [Email])
)
GO


CREATE TABLE SMS.[TimeSpentLearning](
  [SrNo] int,
  [Email] varchar(100),
  [HoursSpent] decimal(12,10) not null,
  [Date] date not null
  PRIMARY KEY ([SrNo], [Email])
)
GO


/****Foreign Keys****/

ALTER TABLE Studently.SMS.[ToDoList] ADD FOREIGN KEY ([Email]) REFERENCES Studently.SMS.[Student] ([Email])
GO

Alter Table SMS.[Assignment] Add Foreign Key ([Email]) REFERENCES SMS.[Student] ([Email])
GO

ALTER TABLE SMS.[CountDownClock] ADD FOREIGN KEY ([Email]) REFERENCES SMS.[Student] ([Email])
GO

ALTER TABLE SMS.[BlockStudent] ADD FOREIGN KEY ([Email]) REFERENCES SMS.[Teacher] ([Email])
GO

ALTER TABLE SMS.[BlockStudent] ADD FOREIGN KEY ([StudentEmail]) REFERENCES SMS.[Student] ([Email])
GO

ALTER TABLE SMS.[Announcement] ADD FOREIGN KEY ([Email]) REFERENCES SMS.[Teacher] ([Email])
GO

ALTER TABLE SMS.[TimeSpentLearning] ADD FOREIGN KEY ([Email]) REFERENCES SMS.[Student] ([Email])
GO


/****Table Deletion****/

Drop Table SMS.TimeSpentLearning
Drop Table SMS.Planner
Drop Table SMS.Reminder
Drop Table SMS.Announcement
Drop Table SMS.BlockStudent
Drop Table SMS.CountdownClock
Drop Table Studently.SMS.ToDoList
Drop Table SMS.Assignment
Drop Table Studently.SMS.Teacher
Drop Table Studently.SMS.Student

/****Schema Deletion****/

Drop Schema SMS