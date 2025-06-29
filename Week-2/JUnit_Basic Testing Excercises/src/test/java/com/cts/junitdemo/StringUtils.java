package com.cts.junitdemo;

public class StringUtils {
    public boolean isPalindrome(String input) {
        if (input == null) return false;
        String reversed = new StringBuilder(input).reverse().toString();
        return input.equals(reversed);
    }
}
