# https://adventofcode.com/2018/day/5

def reduce_str(s: str) -> str:
    # reduce
    # check if modified
    # -> if not, return
    # if yes -> do it again

    while True:
        p = list(zip(s[:-1],s[1:]))
        m = 0 # is modded?

        for i in range(len(p)): # check all the possible pairs
            pair = p[i]
            if abs(ord(pair[0])-ord(pair[1])) == 32: # distance between lower and upper cases
                m = 1 # mark as modified
                s = s[:i] + s[i+2:]
                break # one mod is enough

        if not m:
            # not modified? -> end
            break

    return s

# ---

assert reduce_str("aA") == ""
assert reduce_str("Aa") == ""
assert reduce_str("aa") == "aa"
assert reduce_str("AA") == "AA"
assert reduce_str("xAa") == "x"
assert reduce_str("xaA") == "x"
assert reduce_str("xaa") == "xaa"
assert reduce_str("xAA") == "xAA"

assert reduce_str("dabAcCaCBAcCcaDA") == "dabCBAcaDA"

# ---

if __name__ == "__main__":
    f = open("input.txt")
    s = f.read().strip()
    f.close()

    # ---

    min_len = len(s)
    for d in range(ord('a'), ord('z')+1):
        ns = ''.join([i for i in s if i.lower() != chr(d)]) # new string
        if len(s) == len(ns):
            continue # nothing has been deleted for that pair (apparently)

        z = len(reduce_str(ns))
        min_len = min(min_len, z) # update min len

    print(min_len)
