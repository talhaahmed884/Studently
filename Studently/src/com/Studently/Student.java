package com.Studently;

public class Student extends Person {
    private static Student instance;
    private int profileStatus;

    private Student() {
        super();
        profileStatus = 1;      /***1 = Public, 0 = Private Profile*/
    }

    private Student(String email, String fName, String lName, String university) {
        super(email, fName, lName, university);
        profileStatus = 1;      /***1 = Public, 0 = Private Profile*/
    }

    public static Student getInstance() {
        if (instance == null) {
            return new Student();
        }
        return instance;
    }

    public static Student getInstance(String email, String fName, String lName, String university) {
        if (instance == null) {
            return new Student(email, fName, lName, university);
        }
        return instance;
    }

    public int getProfileStatus() {
        return profileStatus;
    }

    public void setProfileStatus(int profileStatus) {
        this.profileStatus = profileStatus;
    }

    public String toString() {
        String data = "First Name: " + this.getFName() + ", Last Name: " + this.getLName() + ", Email: " + this.getEmail() + ", University: " + this.getUniversity() + ", Profile Status: ";
        if (profileStatus == 0) {
            data += "Private";
        } else {
            data += "Public";
        }
        return data;
    }
}