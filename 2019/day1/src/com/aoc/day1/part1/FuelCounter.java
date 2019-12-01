package com.aoc.day1.part1;

import java.io.*;

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
        return (int) Math.floor(mass / 3.0) - 2;
    }
}
