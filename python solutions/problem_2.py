def fib(n):
    if(n == 1):
        return 1
    elif(n == 2):
        return 2
    else:
        return fib(n-1)+fib(n-2)

def sum_of_even_num(n):
    sum = 0
    for i in range(1, n+1):
        if(fib(i)%2 == 0):
            sum += fib(i)

    return sum

print(sum_of_even_num(32))
