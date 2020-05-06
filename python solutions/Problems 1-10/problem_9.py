from math import sqrt, floor 

def pythagorean_triplet(number): #finding a pythagorean triplet where the sum of it is equal to number
    for n in range(1, floor(sqrt(number))):
        for m in range(n, floor(sqrt(number))): #for loop for m starting at n since n < m 
            a = m*m - n*n #using the equations for finding pythagorean triple
            b = 2*m*n
            c = m*m + n*n
            if(a + b + c == number):
                return a*b*c

                                 
print(pythagorean_triplet(1000))
        
