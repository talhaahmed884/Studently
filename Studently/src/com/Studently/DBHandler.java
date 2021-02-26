package com.Studently;

public interface DBHandler<I> {
    void add(I person, String data);

    I get(String email);
}
