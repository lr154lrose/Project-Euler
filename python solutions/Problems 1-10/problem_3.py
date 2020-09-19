from math import sqrt, floor


def factors(n):
    myList = []
    for i in range(1, floor(n / 2)):
        if n % i == 0:
            prime = True
            for j in range(2, floor(sqrt(i))):
                print(i, j)
                if i % j == 0:
                    prime = False
                    break
            if prime == True:
                myList.append(i)

    return myList[-1]


result = factors(5143)
print("The biggest prime factor is: ", result)
