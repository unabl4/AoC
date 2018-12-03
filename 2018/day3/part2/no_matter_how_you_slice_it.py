# https://adventofcode.com/2018/day/3

import re
r = re.compile(r'#(\d+) @ (\d+),(\d+): (\d+)x(\d+)')

# extract numbers
def parse_claim(line: str):
    m = r.search(line)
    return [int(i) for i in m.groups()] # -> int

if __name__ == "__main__":
    f = open("input.txt", "r")
    i = f.read() # raw input
    f.close()

    c = i.split('\n')[:-1] # claims
    n = len(c)

    claims = [[]] * n

    # part 1: get max dimensions
    w=h=0
    for i in range(n):
        z = parse_claim(c[i])
        claims[i] = z

        w = max(w,z[1]+z[3])
        h = max(h,z[2]+z[4])

    ids = [0] * n

    # form the grid (according to the dimensions)
    g = [[0 for _ in range(w)] for _ in range(h)]
    for c in claims:
        for y in range(c[2],c[2]+c[4]):
            for x in range(c[1],c[1]+c[3]):
                if g[y][x] != 0:
                    # already taken -> mark as overlapping
                    ids[c[0]-1] = 1
                    ids[g[y][x]-1] = 1
                else:
                    g[y][x] = c[0]


    assert sum(i == 0 for i in ids) == 1 # exactly one non-overlapping claim
    print(ids.index(0)+1)
