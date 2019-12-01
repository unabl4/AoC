package com.aoc.day1.part2;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class FuelCounter {
    public static void main(String[] args) throws IOException {
        File file = new File("input.txt");
        int sum = 0;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String massLine;

            while ((massLine = br.readLine()) != null) {
                int mass = Integer.parseInt(massLine);
                sum += getFuelQuantity(mass);
            }
        }

        System.out.println(sum);
    }

    // main formula
    static int getFuelQuantity(int mass) {
        if(mass <= 0) return 0; // base case

        int v = (int) Math.floor(mass / 3.0) - 2;
        return Math.max(v,0) + getFuelQuantity(v);
    }
}
