package com.aoc.day4.part2;

public class SecureContainer {
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
            int c = 0;

            while(i+1 < l && digits[i+1] == digits[i]) {
                c++;
                i++;
            }

            if(c == 1) return true;
            i++;
        }

        return false;
    }
}