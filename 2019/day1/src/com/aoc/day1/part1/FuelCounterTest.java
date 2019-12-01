package com.aoc.day1.part1;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class FuelCounterTest {

    @Test
    void testFuelQuantity() {
        assertEquals(2, FuelCounter.getFuelQuantity(12));
        assertEquals(2, FuelCounter.getFuelQuantity(14));
        assertEquals(654, FuelCounter.getFuelQuantity(1969));
        assertEquals(33583, FuelCounter.getFuelQuantity(100756));
    }
}