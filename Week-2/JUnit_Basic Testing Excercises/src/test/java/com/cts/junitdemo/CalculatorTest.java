package com.cts.junitdemo;

import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {

    @Test
    public void testAdd() {
        int a = 5;
        int b = 3;
        int result = a + b;
        assertEquals(8, result);
    }
}
