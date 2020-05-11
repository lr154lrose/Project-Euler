'''
Program finding the first triangle number with over n divisors.
A triangle number is the sum of the natural numbers up to it.

ex: the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28 '''

from math import sqrt

def finding_triangle_number(n):
    return n*(n+1)/2

def triangle_divisors(n):   #function returning the first triangle number with more than n divisors
    i = 1
    while(1):
        if(divisors(finding_triangle_number(i)) > n - 1):
            return int(finding_triangle_number(i))
        i += 1

def divisors(n):            #function returning the number of divisors of a number
    result = 0
    for i in range(1, round(sqrt(n)) + 1):
        if n%i == 0:
            result += 2
    return result-1
        

if __name__=="__main__":
    print(triangle_divisors(500))
