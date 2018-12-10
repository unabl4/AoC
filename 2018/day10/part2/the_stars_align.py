# https://adventofcode.com/2018/day/10

import re
r = re.compile(r"position=<(.*?)> velocity=<(.*)>")

# extract the numbers: x,y,dx,dy
def parse_point(s):
    m = r.match(s)
    t = [[int(j) for j in i.split(',')] for i in m.groups()]
    return [x for s in t for x in s] # flatten

# movement simulation
def move_points(points):
    n = len(points) # number of points
    new_points = [[0 for _ in range(4)] for _ in range(n)]

    for i in range(n):
        current_point = points[i]
        dx,dy = current_point[2:4]
        new_points[i][0] = current_point[0] + dx # +dx
        new_points[i][1] = current_point[1] + dy # +dy
        new_points[i][2] = dx
        new_points[i][3] = dy

    return new_points

# finds the area required to place all the points
def get_area(points):
    min_x = max_x = points[0][0]
    min_y = max_y = points[0][1]
    for p in points:
        if p[0] < min_x:
            min_x = p[0]
        elif p[0] > max_x:
            max_x = p[0]

        if p[1] < min_y:
            min_y = p[1]
        elif p[1] > max_y:
            max_y = p[1]

    # width/height
    w = max_x-min_x+1
    h = max_y-min_y+1
    return w*h

# output
def print_points(points):
    # 1) find the min/max x/y
    # 2) get all the points' coordinates and put them into a set
    # 3) main loop

    coords = set()
    min_x = max_x = points[0][0]
    min_y = max_y = points[0][1]
    for p in points:
        if p[0] < min_x:
            min_x = p[0]
        elif p[0] > max_x:
            max_x = p[0]

        if p[1] < min_y:
            min_y = p[1]
        elif p[1] > max_y:
            max_y = p[1]

        coords.add((p[0],p[1])) # lookup
    center_x, center_y = -min_x, -min_y

    # width/height
    w = max_x-min_x+1
    h = max_y-min_y+1

    for y in range(h):
        line = ['.'] * w
        for x in range(w):
            dy = y-center_y
            dx = x-center_x
            z = (dx,dy)
            if z in coords:
                line[x] = '#'
        print(''.join(line))
    print('\n')

# ---

if __name__ == "__main__":
    f = open("input.txt")
    points_str = f.read().strip().split('\n')
    f.close()

    points = [parse_point(p) for p in points_str]
    area = get_area(points) # initial area

    seconds = 0
    while True:
        # while the 'area' is shrinking
        new_points = move_points(points)
        new_area = get_area(new_points)
        if new_area < area:
            area = new_area # update
            points = new_points
            seconds += 1
        else:
            break


    print_points(points)
    print("Duration in seconds: ", seconds)
