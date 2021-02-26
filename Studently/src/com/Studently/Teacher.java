package com.Studently;

public class Teacher extends Person {
    private static Teacher instance;
    private String office;
    private String course;

    private Teacher() {
        super();
        office = "";
        course = "";
    }

    private Teacher(String email, String fName, String lName, String university, String office, String course) {
        super(email, fName, lName, university);
        this.office = office;
        this.course = course;
    }

    public static Teacher getInstance() {
        if (instance == null) {
            instance = new Teacher();
        }
        return instance;
    }

    public static Teacher getInstance(String email, String fName, String lName, String university, String office, String course) {
        if (instance == null) {
            instance = new Teacher(email, fName, lName, university, office, course);
        }
        return instance;
    }

    public String getOffice() {
        return this.office;
    }

    public void setOffice(String office) {
        this.office = office;
    }

    public String getCourse() {
        return this.course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String toString() {
        String data = "First Name: " + this.getFName() + ", Last Name: " + this.getLName() + ", Email: " + this.getEmail() + ", University: " + this.getUniversity() + ", Course: " + course + ", Office: " + office + "\n";
        return data;
    }
}
