package com.Studently;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static Database instance;
    private final String userName;
    private final String password;
    private Connection conn;


    private Database() {
        userName = "talhaahmed";
        password = "1212";
    }


    public static Database getInstance() {
        if (instance == null) {
            instance = new Database();
        }

        return instance;
    }


    private void setConnection() {
        if (conn == null) {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=master", userName, password);
            } catch (ClassNotFoundException | SQLException ex) {
                ex.printStackTrace();
            }
        }

        return;
    }


    public Connection getConnection() {
        setConnection();
        return conn;
    }


    public void closeConnection() {
        try {
            conn.close();
            conn = null;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return;
    }
}
