package com.aoc.day2.part2;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class ProgramAlarmTest {
    @Test
    public void testProgramEndState() {
        int[] program = new int[] { 1,9,10,3,2,3,11,0,99,30,40,50 };
        assertEquals(3500, ProgramAlarm.programEndState(program));
    }
}