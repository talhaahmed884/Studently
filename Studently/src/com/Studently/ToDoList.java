package com.Studently;

public class ToDoList {
    private String task;

    public ToDoList() {
        task = "";
    }

    public ToDoList(String task) {
        this.task = task;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String toString() {
        String data = "Task: " + task;
        return data;
    }
}
