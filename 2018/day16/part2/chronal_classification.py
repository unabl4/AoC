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

    # IDEA: group all the samples by the op code (step 1), and start executing OPs:
    # if there is only one OP that satisfies all the samples -> consider it resolved and move on to the next
    # if there are multiple OPs -> move on to the next group and return to it later (re-consider)
    # TAGS: modulo, resolution matrix

    groups = {} # op-code groups
    for sample_raw in samples_raw:
        sample = parse_sample(sample_raw) # tuple
        state_before, instruction, state_after = sample # destructive assignment
        op_code = instruction[0] # number
        if op_code not in groups:
            groups[op_code] = [] # create a new group

        groups[op_code].append(sample)

    group_ids = list(groups.keys()) # for group indexes
    ops_mapping = {} # mapping <op code> -> op name
    group_index = 0 # cycle
    assigned = False
    while True:
        current_group_id = group_ids[group_index] # id
        if current_group_id not in ops_mapping:
            current_group = groups[current_group_id]
            valid_ops = set() # reset
            for op in OPS:
                valid = True # is valid op for the group (assumed to be valid)
                for state_before,instruction,state_after in current_group:
                    instruction[0] = op # for now
                    if execute_operation(instruction, state_before) != state_after:
                        # the OP cannot be considered as it does not satisfy
                        valid = False
                        break

                if not valid:
                    continue # move on to the next op to try

                valid_ops.add(op)

            candidate_ops = [op for op in valid_ops if op not in ops_mapping.values()]
            if len(candidate_ops) <= 0:
                raise "No OPs found" # Uh-oh, something is not right
            elif len(candidate_ops) == 1:
                ops_mapping[current_group_id] = candidate_ops[0]
                assigned = True

        if group_index >= len(OPS)-1: # reached the end?
            if assigned:
                group_index = 0 # start from the very beginning
                assigned = False
            else: # <= 0
                break # stop
        else:
            group_index += 1

    # ---
    # by now we have the mapping
    # now we need to 'run' the program

    print(ops_mapping)
    f = open("program.txt")
    p = f.read().strip().split('\n') # read the program
    f.close()

    instructions = [[int(i) for i in p.split()] for p in p] # convert it to instructions
    state = [0] * 4 # initial state

    for instruction in instructions:
        op_name = ops_mapping[instruction[0]]
        instruction[0] = op_name
        state = execute_operation(instruction, state)

    print(state[0])
