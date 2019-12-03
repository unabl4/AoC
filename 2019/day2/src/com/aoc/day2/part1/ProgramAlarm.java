package com.aoc.day2.part1;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

public class ProgramAlarm {
    private final static int OP_SUM  = 1;
    private final static int OP_MUL  = 2;
    private final static int OP_HALT = 99; // stop condition

    public static void main(String[] args) throws IOException {
	    // write your code here

        String programString = new String(Files.readAllBytes(Paths.get("input.txt")));

        int[] program = Arrays.stream(programString.split(",")).mapToInt(Integer::parseInt).toArray();
        program[1] = 12;
        program[2] = 2;
        int endState = programEndState(program);

        System.out.println(endState);
    }

    // program executor
    static int programEndState(int[] program) {
        int pc = 0; // current instruction pointer
        int opcode;

        while(true) {
            opcode = program[pc];
            if(opcode == OP_HALT) break;

            int firstOperand  = program[pc+1];
            int secondOperand = program[pc+2];
            int target = program[pc+3];

            switch(opcode) {
                case OP_SUM:
                    // sum
                    program[target] = program[firstOperand] + program[secondOperand];
                    break;
                case OP_MUL:
                    // mul
                    program[target] = program[firstOperand] * program[secondOperand];
            }

            pc += 4;    // go to next instruction
        }

        return program[0];
    }
}
