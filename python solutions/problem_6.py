def sum_of_squares(n): #function returning the sum of the squares of the first n natural numbers
    sum = 0
    for i in range(n + 1):
        sum += i*i

    return sum

def square_of_sum(n): #function returning the square of the um of the first n natural numbers
    sum = 0
    for i in range(n + 1):
        sum += i

    return sum*sum

def difference(n): #function returning the difference between the sum of squares and the square of the sum for the first n natural numbers
    return square_of_sum(n) - sum_of_squares(n)

print("This is the difference: ", difference(100))
