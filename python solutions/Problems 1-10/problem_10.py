from math import sqrt


def is_prime(n):
    for number in range(2, int(sqrt(n)) + 1):
        if n % number == 0:
            return False

    return True


def sum_of_primes(n):
    sum_primes = 0
    for i in range(2, n):
        if is_prime(i):
            sum_primes += i

    return sum_primes


print(sum_of_primes(2000000))
