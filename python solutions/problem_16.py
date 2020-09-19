# Program finding the sum of the digits of a power of 2


def power_of_two(power):
    return pow(2, power)


def sum_of_digits(number):
    string_number = str(number)
    sum_digits = 0
    for digit in string_number:
        sum_digits += int(digit)

    return sum_digits


if __name__ == "__main__":
    print(sum_of_digits(power_of_two(1000)))
