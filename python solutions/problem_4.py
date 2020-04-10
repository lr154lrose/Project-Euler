def is_palindrome(n): #function that finds if a number is a palindrome 
    palindrome = True
    digits = [int(digit) for digit in str(n)]
    for i in range(0, len(digits)//2):
        if(digits[i] == digits[-i-1]):
            continue
        else:
            palindrome = False
            break
    return palindrome

def biggest_palindrome(): #finding the biggest palindrome made from the product of 3-digit numbers
    biggest = 1001
    for i in range(100, 1000):
        for j in range(100, 1000):
            if(is_palindrome(i*j) and i*j > biggest):
                biggest = i*j
    return biggest

print(biggest_palindrome())
