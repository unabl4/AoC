# https://adventofcode.com/2018/day/16

OPS = ['addr', 'addi','mulr','muli','banr','bani','borr','bori','setr','seti','gtir','gtri','gtrr','eqir','eqri','eqrr']

def execute_operation(instruction, state):
    op,A,B,C = instruction # decompose
    new_state = state.copy() # not to modify the original

    if op == 'addr':
        new_state[C] = state[A]+state[B]
    elif op == 'addi':
        new_state[C] = state[A]+B
    elif op == 'mulr':
        new_state[C] = state[A]*state[B]
    elif op == 'muli':
        new_state[C] = state[A]*B
    elif op == 'banr':
        new_state[C] = state[A] & state[B] # bitwise-and
    elif op == 'bani':
        new_state[C] = state[A] & B
    elif op == 'borr':
        new_state[C] = state[A] | state[B] # bitwise-or
    elif op == 'bori':
        new_state[C] = state[A] | B
    elif op == 'setr':
        new_state[C] = state[A]
    elif op == 'seti':
        new_state[C] = A
    elif op == 'gtir':
        new_state[C] = 1 if A > state[B] else 0
    elif op == 'gtri':
        new_state[C] = 1 if state[A] > B else 0
    elif op == 'gtrr':
        new_state[C] = 1 if state[A] > state[B] else 0
    elif op == 'eqir':
        new_state[C] = 1 if A == state[B] else 0
    elif op == 'eqri':
        new_state[C] = 1 if state[A] == B else 0
    elif op == 'eqrr':
        new_state[C] = 1 if state[A] == state[B] else 0

    return new_state

def parse_sample(input):
    lines = input.split('\n')
    before,after= [eval(lines[i][7:]) for i in (0,2)]
    instruction = [int(i) for i in lines[1].split()]
    return (before,instruction,after)

if __name__ == "__main__":
    f = open("input.txt")
    samples_raw = f.read().split('\n\n')
    f.close()

    counter = 0
    for sample_raw in samples_raw:
        same_counter = 0
        state_before, instruction, state_after = parse_sample(sample_raw)

        for op in OPS:
            instruction[0] = op # substitute (for now)
            print(instruction)
            if execute_operation(instruction, state_before) == state_after:
                same_counter += 1
            if same_counter >= 3:
                counter += 1 # main counter
                break

    print(counter)
