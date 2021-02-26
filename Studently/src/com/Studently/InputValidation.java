package com.Studently;

import java.sql.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InputValidation {
    public boolean validateName(String name) {
        return Pattern.matches("[A-Za-z]*", name) && !name.contains(" ") && name.length() >= 3;
    }

    public boolean validateEmail(String emailAddress) {
        return Pattern.matches("^[(a-zA-Z-0-9-\\_\\+\\.)]+@[(a-z-A-z)]+\\.[(a-zA-z)]{2,3}$", emailAddress);
    }

    public boolean validatePassword(String pass) {
        String regex = "^(?=.*[0-9])"
                + "(?=.*[a-z])(?=.*[A-Z])"
                + "(?=.*[!@#&()–[{}]:;'_.,?/*~$^+=<>])"
                + "(?=\\S+$).{8,20}$";
        return validateRegexString(regex, pass) != false;
    }

    public boolean validateUniversityName(String university) {
        String specialCharacters = "!@$%*()+<=>?[]^`{|}";
        String regex = ".*[a-zA-Z]+.*";
        return validateSpecialCharacters(university, specialCharacters) != false && validateRegexString(regex, university) != false;
    }

    public boolean validateRoomAddress(String room) {
        String specialCharacters = "!%*+<>?^`{|}";
        String regex = ".*[a-zA-Z]+.*";

        return validateSpecialCharacters(room, specialCharacters) != false && validateRegexString(regex, room) != false;
    }

    public boolean validateCourseName(String course) {
        String specialCharacters = "!@$%*+<>?^`{|}";
        String regex = ".*[a-zA-Z]+.*";

        return validateSpecialCharacters(course, specialCharacters) != false && validateRegexString(regex, course) != false;
    }

    public boolean validateInput(String s) {
        String regex = ".*[a-zA-Z]+.*";

        return validateRegexString(regex, s) != false;
    }

    private boolean validateSpecialCharacters(String inputOne, String inputTwo) {
        for (int i = 0; i < inputOne.length(); i++) {
            if (inputTwo.contains(Character.toString(inputOne.charAt(i)))) {
                return false;
            }
        }
        return true;
    }

    private boolean validateRegexString(String regex, String input) {
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(input);
        return m.matches() && input.length() >= 2;
    }

    public boolean validateDate(Date d) {
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        return !d.before(date);
    }
}
