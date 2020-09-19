"""
Program finding starting number (under one million) which
produces the longest Collatz sequence
"""


def collatz(n, sequence_elements):
    if n == 1:
        return sequence_elements + 1
    elif n % 2 == 0:
        return collatz(n // 2, sequence_elements + 1)
    else:
        return collatz(3 * n + 1, sequence_elements + 1)


def compute():
    biggest_sequence = 0
    number = 0
    i = 1
    while i < 1000:
        current_iteration = collatz(i, 0)
        if current_iteration > biggest_sequence:
            print(current_iteration, i)
            biggest_sequence = current_iteration
            number = i
        i += 1

    return number


if __name__ == "__main__":
    print(compute())
