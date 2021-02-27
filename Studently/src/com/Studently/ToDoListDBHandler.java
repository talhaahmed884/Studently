package com.Studently;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ToDoListDBHandler implements DBHandler<ToDoList> {
    private final Database database;

    public ToDoListDBHandler() {
        database = Database.getInstance();
    }

    @Override
    public void add(ToDoList toDoList, String email) {
        String query = "Use Studently EXEC SMS.Insert_ToDoList '" + email + "', '" + toDoList.getTask() + "'";
        try {
            PreparedStatement ps = database.getConnection().prepareStatement(query);
            ps.execute();
            ps.close();
            database.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<ToDoList> get(String email) {
        String query = "Select Task FROM Studently.SMS.ToDoList WHERE Email = '" + email + "'";

        try {
            PreparedStatement ps = database.getConnection().prepareStatement(query);
            ResultSet result = ps.executeQuery();

            List<ToDoList> toDoLists = new ArrayList<>();

            while (result.next()) {
                toDoLists.add(new ToDoList(result.getString("Task")));
            }

            ps.close();
            result.close();
            database.closeConnection();

            return toDoLists;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int exists(String email, String task) {
        String query = "Select SMS.TaskExists('" + task + "','" + email + "')";

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
}
