package com.Studently;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StudentDBHandler implements StudentTeacherDBHandler {
    private final Database database;

    public StudentDBHandler() {
        database = Database.getInstance();
    }

    @Override
    public String getPassword(String email) {
        String query = "Select \"Password\" from Studently.SMS.Student where Email = '";
        query += email;
        query += "'";

        try {
            PreparedStatement ps = database.getConnection().prepareStatement(query);
            ResultSet result = ps.executeQuery();

            if (result.next()) {
                return result.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int exists(String email) {
        String query = "Use Studently Select SMS.StudentExists('";
        query += email;
        query += "')";

        try {
            PreparedStatement ps = database.getConnection().prepareStatement(query);
            ResultSet result = ps.executeQuery();

            if (result.next()) {
                return result.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public void add(Object person, String password) {
        Student student = (Student) person;
        String query = "Use Studently EXEC SMS.Insert_Student '" + student.getEmail() + "','" + student.getFName() + "', '" + student.getLName() + "' , '" + password + "', '" + student.getUniversity() + "'";

        try {
            PreparedStatement ps = database.getConnection().prepareStatement(query);
            ps.execute();
            database.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Object get(String email) {
        Student newStudent = Student.getInstance();

        String query = "Select Email, Fname, Lname, University, ProfileStatus FROM Studently.SMS.Student WHERE Email = '" + email + "'";

        try {
            PreparedStatement ps = database.getConnection().prepareStatement(query);
            ResultSet result = ps.executeQuery();

            if (result.next()) {
                newStudent.setEmail(result.getString("Email"));
                newStudent.setFName(result.getString("Fname"));
                newStudent.setLName(result.getString("Lname"));
                newStudent.setUniversity(result.getString("University"));
                newStudent.setProfileStatus(result.getInt("ProfileStatus"));
                result.close();
                database.closeConnection();
                return newStudent;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}