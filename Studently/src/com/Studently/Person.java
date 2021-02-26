package com.Studently;

public class Person {
    private String email;
    private String fName;
    private String lName;
    private String university;

    public Person() {
        email = "";
        fName = "";
        lName = "";
        university = "";
    }

    public Person(String email, String fName, String lName, String university) {
        this.email = email;
        this.fName = fName;
        this.lName = lName;
        this.university = university;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFName() {
        return fName;
    }

    public void setFName(String fName) {
        this.fName = fName;
    }

    public String getLName() {
        return lName;
    }

    public void setLName(String lName) {
        this.lName = lName;
    }

    public String getUniversity() {
        return this.university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String toString() {
        String data = "First Name: " + fName + ", Last Name: " + lName + ", Email: " + email + ", University: " + university;
        return data;
    }
}
