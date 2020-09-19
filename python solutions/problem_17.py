# Program that adds up the letters from numbers in the range 1-1000
# Spaces and hyphens don't cound and the numbers are written in compliance with the British usage
# ex: 342 - three hundred and forty-two has 23 letters

# zero, one, two, three, four, five, six, seven, eight, nine
one_digit = {0: 0, 1: 3, 2: 3, 3: 5, 4: 4, 5: 4, 6: 3, 7: 5, 8: 5, 9: 4}

# eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
teens = {10: 3, 11: 6, 12: 6, 13: 8, 14: 8, 15: 7, 16: 7, 17: 9, 18: 8, 19: 8}

# twenty, thirty, forty, fifty, sixty, seventy, eighty, ninety
tens = {0: 0, 20: 6, 30: 6, 40: 5, 50: 5, 60: 5, 70: 7, 80: 6, 90: 6}

_hundred = 7
_and = 3


def add_up_letters(i, n):
    sum_of_letters = 0

    for number in range(i, n + 1):
        if len(str(number)) == 1:
            sum_of_letters += one_digit[number]
        if len(str(number)) == 2:
            if number in teens:
                sum_of_letters += teens[number]
            else:
                sum_of_letters += one_digit[number % 10]
                sum_of_letters += tens[number - number % 10]

        if len(str(number)) == 3:
            if number == 100:
                sum_of_letters += 10
            else:
                sum_of_letters += one_digit[number // 100] + _hundred
            if number % 100 in teens:
                sum_of_letters += teens[number % 100]
                sum_of_letters += _and
            else:
                sum_of_letters += one_digit[number % 10]
                if number - number % 10 - number // 100 * 100 == 0 and number % 10 == 0:
                    pass
                else:
                    sum_of_letters += _and
                    sum_of_letters += tens[number - number % 10 - number // 100 * 100]

        if len(str(number)) == 4:
            sum_of_letters += len("onethousand")

    return sum_of_letters


if __name__ == "__main__":
    print(add_up_letters(1, 1000))
