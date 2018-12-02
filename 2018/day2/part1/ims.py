# https://adventofcode.com/2018/day/2

from functools import reduce

def twos_threes(input):
    f = {}
    for c in input:
        f[c] = f.get(c,0)+1

    twos = threes = 0
    for v in f.values():
        if v == 2: # exactly two times
            twos = 1

        if v == 3: # exactly three times
            threes = 1

    return (twos, threes)

# ---

if __name__ == "__main__":
    f = open("input.txt", "r")
    b = f.read() # box ids
    f.close()

    i = b.split('\n')[:-1]
    e = [twos_threes(box) for box in i]
    a,b = reduce(lambda x,y: (x[0]+y[0],x[1]+y[1]), e)
    print(a*b)
