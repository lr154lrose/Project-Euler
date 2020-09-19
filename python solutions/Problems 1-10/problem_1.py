# function that takes as parameter a number and returns the sum of all
# multiples of 3 and 5 below that number


def sum_of_multiples(n):
    sum = 0
    for i in range(1, n + 1):
        if i % 5 == 0 and i % 3 == 0:
            sum += i
        elif i % 5 == 0:
            sum += i
        elif i % 3 == 0:
            sum += i
        else:
            pass

    return sum


print(sum_of_multiples(999))
