package com.Studently;

public interface StudentTeacherDBHandler<I> extends DBHandler<I> {
    String getPassword(String email);

    int exists(String email);

    I get(String data);
}
