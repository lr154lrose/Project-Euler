from math import floor, sqrt


def is_prime(
    number,
):  # returning Boolean whether the number given as parameter is prime or not
    prime = True
    for i in range(2, floor(sqrt(number)) + 1):
        if number % i == 0:
            prime = False

    return prime


def nth_prime(n):  # finding the nth prime number
    prime_number = 1
    for i in range(1, n + 1):
        prime_number += 1
        while not is_prime(prime_number):
            prime_number += 1

    return prime_number


print(nth_prime(10001))
