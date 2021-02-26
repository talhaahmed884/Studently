package com.Studently;

public interface StudentTeacherDBHandler extends DBHandler{
    String getPassword(String email);

    int exists(String email);
}
