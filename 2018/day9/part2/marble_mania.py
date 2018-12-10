# https://adventofcode.com/2018/day/9

class Node:
    def __init__(self, value):
        self.value = value
        # ---
        self.next = None
        self.prev = None

# ---

def winning_score(num_of_players, max_marble):
    player_counter = 0 # index
    marble_counter = 1
    current_marble = Node(0) # linked list
    current_marble.next = current_marble
    current_marble.prev = current_marble
    scores = [0] * num_of_players

    while marble_counter != max_marble: # ?
        if marble_counter > 0 and marble_counter % 23 == 0: # multiple of 23?
            # special case -> scores
            scores[player_counter] += marble_counter

            m = current_marble
            for _ in range(7):
                m = m.prev # 7 positions counter-clockwise

            scores[player_counter] += m.value # marble value is added
            current_marble = m.next # immediately clockwise = new current marble
            a,b = m.prev,m.next
            a.next = b
            b.prev = a
        else:
            a = current_marble.next # 1
            b = a.next # 2

            n = Node(marble_counter) # new node
            # insert in-between
            n.prev = a
            n.next = b
            a.next = n
            b.prev = n
            current_marble = n

        # switch
        player_counter = (player_counter+1) % num_of_players
        marble_counter += 1 # move on to the next marble

    # return the max score
    return max(scores)

# ---

# assert winning_score(9,25) == 32
# assert winning_score(10,1618) == 8317
# assert winning_score(13,7999) == 146373

print(winning_score(419, 7105200))
