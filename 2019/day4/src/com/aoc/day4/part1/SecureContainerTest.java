package com.aoc.day4.part1;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class SecureContainerTest {
    @Test
    public void testIsCorrectPasswords() {
        assertTrue(SecureContainer.isCorrectPassword(111111));
        assertFalse(SecureContainer.isCorrectPassword(223450));
        assertFalse(SecureContainer.isCorrectPassword(123789));
    }
}