package com.aoc.day1.part2;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class FuelCounterTest {
    @Test
    void testFuelQuantity() {
        assertEquals(2, FuelCounter.getFuelQuantity(12));
        assertEquals(966, FuelCounter.getFuelQuantity(1969));
        assertEquals(50346, FuelCounter.getFuelQuantity(100756));
    }
}