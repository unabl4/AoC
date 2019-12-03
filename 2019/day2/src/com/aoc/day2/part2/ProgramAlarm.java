package com.aoc.day2.part2;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

public class ProgramAlarm {
    private final static int OP_SUM  = 1;
    private final static int OP_MUL  = 2;
    private final static int OP_HALT = 99; // stop condition
    private final static int TARGET_STATE = 19690720; // target value

    public static void main(String[] args) throws IOException {
        String programString = new String(Files.readAllBytes(Paths.get("input.txt")));

        int[] intProgram = Arrays.stream(programString.split(",")).mapToInt(Integer::parseInt).toArray();
        for(int noun=0; noun <= 99; noun++) {
            for(int verb=0; verb <= 99; verb++) {
                int[] program = Arrays.copyOf(intProgram, intProgram.length);   // reset

                program[1] = noun;
                program[2] = verb;
                int endState = programEndState(program);

                if(endState == TARGET_STATE) {
                    System.out.println(100 * noun + verb);
                    return; // quit
                }
            }
        }
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
