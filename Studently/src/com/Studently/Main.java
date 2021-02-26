package com.Studently;

public class Main {

    public static void main(String[] args) {
        Person p = Student.getInstance("talhaahmed884@gmail.com", "Talha", "Ahmed", "NUCES, FAST");
        DBHandler<Student> dbHandler = new StudentDBHandler();
        Student s = dbHandler.get(p.getEmail());
        System.out.println(s);
    }
}
