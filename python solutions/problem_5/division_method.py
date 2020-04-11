from math import sqrt

def is_prime(n):                            #function taking as parameter a number 
    prime = True                            #treating every number as prime at first 
    for i in range(2, round(sqrt(n)) + 1):  #iterating up to the square root of the number 
        if(n%i == 0):                       #if we find a divisor 
            prime = False                   #then it's not prime 
            break                           #break loop 
        else:
            continue
    return prime                            #returning boolean True if number is prime, False otherwise

def prime_list(start, end):                 #function taking two numbers as parameters, start < end
    myList = []                             #starting with empyt list
    for i in range(start, end + 1):         #iterating through all the numbers in the given range
        if(i == 1):                         #skip if 1
            continue
        if(is_prime(i)):                    #if number is prime
            myList.append(i)                #add to list
    return myList                           #returning the list containing all the prime numbers in the range given by the parameters given

def factors(n, prime_numbers):              #function returning a list containing all the prime factors of the number taken as parameter
    factors_list = []                       #creating empty list 
    for i in prime_numbers:                 #iterating through the list of prime numberss
        if(n%i == 0 and n/i in prime_numbers): #if both divisors are prime
            factors_list.append(i)          #append both of them 
            factors_list.append(round(n/i))
            return factors_list             #returning since both prime divisors found
        elif(n%i == 0 and n/i not in prime_numbers):
            factors_list.append(i)          #we append to list the first prime number found 
            factors_list.extend(factors(round(n/i), prime_numbers)) #using a recursive method to call the function on the new number since it's not a prime
            break                           #break this for loop 
        else:
             pass                           #pass since there is a remainder
    return factors_list

def division_method(start, end):            #function finds the smallest multiple of all the numbers in the range starting at start until the end 
    prime_numbers = prime_list(start, end)  #getting the list of primes in the given range 
    prime_factors = []                      #creating empty list
    smallest_multiple = 1                   #starting at one
    for number in range(start, end + 1):    #for every number in the range
        if number in prime_numbers:         #if number is prime 
            prime_factors.append(number)    #add number to list constituting the divisors 
        else:                               #else number is not prime 
            for i in factors(number, prime_numbers): #for every prime divisor of the number in the range 
                if(factors(number, prime_numbers).count(i) > prime_factors.count(i)): #if the number of instances of prime divisor is bigger than the already existing instances of element in the prime_factors list
                        for j in range(1, factors(number, prime_numbers).count(i) - prime_factors.count(i) +1): #count how many more times it appears in the list for the prime divisors of the number
                            prime_factors.append(i) #append the prime divisor to the list n times, where is equal to the substraction of the count of element in the divisor list minus the occurances in the list of prime_factors
                else:
                    pass                    #pass since the number of occurences of divisor is smaller or equal to the number of occurences in the  
    for number in prime_factors:
        smallest_multiple = smallest_multiple * number #multiplicating all prime factors to find the smallest multiple 

    return smallest_multiple         

print(division_method(1,40))
            
