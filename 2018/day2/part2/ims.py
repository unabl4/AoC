# https://adventofcode.com/2018/day/2

# b1,b2 - box id
def diff(b1,b2):
    assert len(b1) == len(b2)

    c = 0 # diff counter
    n = len(b1)
    for i in range(n):
        if b1[i] != b2[i]:
            c += 1

    return c

def common(b1,b2):
    assert len(b1) == len(b2)

    n = len(b1)
    w = [''] * n # resulting string
    for i in range(n):
        if b1[i] == b2[i]:
            w[i] = b1[i]

    return ''.join(w)

# ---

if __name__ == "__main__":
    f = open("input.txt", "r")
    b = f.read() # box ids
    f.close()

    b = b.split('\n')[:-1] # correct box ids
    n = len(b)

    for x in range(n):
        for y in range(x+1,n):
            if diff(b[x],b[y]) <= 1:
                print(common(b[x],b[y]))
