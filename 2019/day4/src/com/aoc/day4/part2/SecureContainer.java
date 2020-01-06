package com.aoc.day4.part2;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SecureContainer {
    private static final Pattern doubleDigitRegex = Pattern.compile("(\\d)\\1");

    public static void main(String[] args) {
        System.out.println(countCorrectPasswords(172851, 675869));
    }

    // ---


    public static int countCorrectPasswords(int fromRange, int toRange) {
        int c = 0;
        for(int i=fromRange; i <= toRange; i++) {
            if(isCorrectPassword(i)) c++;
        }

        return c;
    }

    /*
        It is a six-digit number.
        The value is within the range given in your puzzle input.
        Two adjacent digits are the same (like 22 in 122345).
        Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).
     */
    public static boolean isCorrectPassword(int password) {
        if(password < 100_000 || password > 999_999) return false;

        int[] digits = new int[6];

        // check if digits are not in decreasing order
        int l = (int)Math.floor(Math.log10(password))+1;    // 6
        int pd = -1;
        for(int i=0; i < l; i++) {
            int z = (int)Math.pow(10, l-1-i);   // divider
            int d = password / z;
            password %= z;

            if(i > 0 && d < pd) return false;
            pd = d; // previous digit
            digits[i] = d;
        }

        int i = 0;
        while(i < l) {
            int j = i+1;
            int c = 1;

            while(j < l && digits[j] == digits[i]) {
                j++;
                c++;
            }

            if(c == 2) return true;
            i = j;
        }

        return false;
    }
}