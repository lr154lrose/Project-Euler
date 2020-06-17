#program finding the number of paths in an N by M grid
#the only moves permitted are down and right since only the shortest paths count
#a path will start at the top left corner with the destination being the bottom right corner

def grid_paths(N, M): 
    return factorial(N+M)//factorial(M)//factorial(N) #using derived formula for combination of n taken by k


def factorial(number): #function returning the factorial of a number
    if number == 2:
        return number
    else:
        return number*factorial(number-1)


if __name__=="__main__":
    print(grid_paths(20, 20))

