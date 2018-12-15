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

# https://stackoverflow.com/questions/10252209/square-with-largest-sum-in-the-matrix/10252633
def max_sum(table):
    h = len(table)
    w = len(table[0]) # 300

    current = [0] * (w+1) # current row/column
    sums = [[0 for _ in range(w+1)] for _ in range(h+1)] # augmented

    # 1) row-wise summation
    for r in range(1,h+1):
        for c in range(1,w+1):
            sums[r][c] += current[c] + table[r-1][c-1]
            current[c] += table[r-1][c-1]

    current = [0] * (h+1) # reset

    # 0 0 0 0       0 0  0  0
    # 0 1 1 1   =>  0 1  2  3
    # 0 3 3 3       0 3  6  9
    # 0 6 6 6       0 6 12 18

    # 2) column-wise summation
    for c in range(1,w+1):
        # print(current)
        for r in range(1,h+1):
            sums[r][c] += current[r]
            current[r] = sums[r][c]

    max_pos = max_sum = max_dim = None
    for y in range(1,h+1):
        for x in range(1,w+1):
            max_k = min(h+1-y+1, w+1-x+1) # max possible square size for a given position
            for k in range(1,max_k): # for all square sizes
                current_sum = sums[y+k-1][x+k-1]-sums[y-1][x+k-1]-sums[y+k-1][x-1]+sums[y-1][x-1]
                # print(y,x,k,current_sum)
                if max_sum is None or (current_sum > max_sum):
                    max_pos = (x,y) # top left corner
                    max_sum = current_sum
                    max_dim = k

    return (max_pos, max_dim)

# ---

if __name__ == "__main__":
    # assert power_level(122,79,57) == -5
    # assert power_level(217,196,39) == 0
    # assert power_level(101,153,71) == 4

    # t1 = max_sum(generate_table(18))
    # assert t1 == ((90,269),16)

    t = generate_table(7689)
    print(max_sum(t))

    # t = [[1,1,1], [2,2,2], [3,3,3]]
    # print(max_sum(t))

# sum[i0..i1, j0..j1](M) = I(i1,j1) - I(i0 - 1, j1) - I(i1, j0 - 1) + I(i0 - 1, j0 - 1)

# 1 1 1      1 1 1      1  2  3
# 2 2 2  =>  3 3 3  =>  3  6  9
# 3 3 3      6 6 6      6 12 18

# SUM(1..2, 1..2) = SUM(2,2) - SUM(0,2) - SUM(2,0) + SUM(0,0) = 18-6-3+1=10
# subtract two times -> add ones at the end
# SUM(0..1,0..1) = SUM(1,1) - SUM(0,1)-SUM(1,0) + SUM(0,0) = 6-0-0+0=6 ????
# SUM(1..1, 1..1) = SUM(1,1) - SUM(0,1) - SUM(1,0) + SUM(0,0) = 6-2-3+1=2

# 1 2 3
# 0 1 3 6
#             0 0  0  0
# 2 2  2      0 2  4  6
# 3 3  3 =>   0 5 10 15
# 4 4 -1      0 9 18 22

# 2 2 2       2  4 6
# 5 5 5  =>   5 10 15
# 9 9 4       9 18 22

# 0 0 0       0 0 0      0 0  0
# 0 0 0  =>   0 0 0  =>  0 0  0
# 0 5 5       0 5 5      0 5 10
