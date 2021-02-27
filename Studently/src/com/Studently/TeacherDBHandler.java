package com.Studently;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TeacherDBHandler implements StudentTeacherDBHandler<Teacher> {
    private final Database database;

    public TeacherDBHandler() {
        database = Database.getInstance();
    }

    @Override
    public String getPassword(String email) {
        String query = "Select \"Password\" from Studently.SMS.Teacher where Email = '";
        query += email;
        query += "'";

        try {
            PreparedStatement ps = database.getConnection().prepareStatement(query);
            ResultSet result = ps.executeQuery();

            if (result.next()) {
                String password = result.getString(1);
                ps.close();
                result.close();
                database.closeConnection();
                return password;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int exists(String email) {
        String query = "Use Studently Select SMS.TeacherExists('";
        query += email;
        query += "')";

        try {
            PreparedStatement ps = database.getConnection().prepareStatement(query);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                int message = result.getInt(1);
                ps.close();
                result.close();
                database.closeConnection();
                return message;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public void add(Teacher teacher, String password) {
        String query = "Use Studently EXEC SMS.Insert_Teacher '" + teacher.getEmail() + "','" + teacher.getFName() + "', '" + teacher.getLName() + "' , '" + password + "', '" + teacher.getUniversity() + "', '" + teacher.getOffice() + "', '" + teacher.getCourse() + "'";

        try {
            PreparedStatement ps = database.getConnection().prepareStatement(query);
            ps.execute();
            ps.close();
            database.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Teacher get(String email) {
        Teacher newTeacher = Teacher.getInstance();

        String query = "Select Email, Fname, Lname, University, Office, Course from Studently.SMS.Teacher where Email = '" + email + "'";

        try {
            PreparedStatement ps = database.getConnection().prepareStatement(query);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                newTeacher.setEmail(result.getString("Email"));
                newTeacher.setFName(result.getString("Fname"));
                newTeacher.setLName(result.getString("Lname"));
                newTeacher.setUniversity(result.getString("University"));
                newTeacher.setOffice(result.getString("Office"));
                newTeacher.setCourse(result.getString("Course"));
                ps.close();
                result.close();
                database.closeConnection();
                return newTeacher;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}