package com.aoc.day4.part2;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class SecureContainerTest {
    @Test
    public void testIsCorrectPasswords() {
        assertTrue(SecureContainer.isCorrectPassword(112233));
        assertFalse(SecureContainer.isCorrectPassword(123444));
        assertTrue(SecureContainer.isCorrectPassword(111122));
    }
}