package com.cts.junitdemo;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class StringUtilsTest {

    private StringUtils stringUtils;

    @Before
    public void setUp() {
        stringUtils = new StringUtils();
        System.out.println("Setup: StringUtils instance created");
    }

    @After
    public void tearDown() {
        stringUtils = null;
        System.out.println("Teardown: StringUtils instance destroyed");
    }

    @Test
    public void testIsPalindromeTrue() {

        String input = "madam";

        boolean result = stringUtils.isPalindrome(input);

        assertTrue(result);
    }

    @Test
    public void testIsPalindromeFalse() {
  
        String input = "hello";

        boolean result = stringUtils.isPalindrome(input);

        assertFalse(result);
    }

    @Test
    public void testIsPalindromeNull() {

        String input = null;
        boolean result = stringUtils.isPalindrome(input);
        assertFalse(result);
    }
}
