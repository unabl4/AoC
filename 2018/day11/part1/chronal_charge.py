# https://adventofcode.com/2018/day/11

def power_level(x,y,serial):
    rack_id = x+10
    power_level = rack_id * y
    power_level += serial
    power_level *= rack_id
    num = str(power_level)[-3]
    return int(num)-5

def generate_table(serial):
    return [[power_level(x+1,y+1,serial) for x in range(300)] for y in range(300)]

# max sum
def max_3x3(table):
    max_sum = None
    max_coords = ()
    for oy in range(300-3-1):
        for ox in range(300-3-1):
            # can be optimized
            current_sum = sum(sum(table[y+oy][x+ox] for x in range(3)) for y in range(3))

            if max_sum is None or (current_sum > max_sum):
                max_sum = current_sum
                max_coords = (ox+1, oy+1)

    return max_coords

# ---

if __name__ == "__main__":
    # assert power_level(122,79,57) == -5
    # assert power_level(217,196,39) == 0
    # assert power_level(101,153,71) == 4

    # t1 = max_3x3(generate_table(18))
    # assert t1 == (33,45)

    # t2 = max_3x3(generate_table(42))
    # assert t2 == (21,61)

    t = generate_table(7689)
    print(max_3x3(t))
