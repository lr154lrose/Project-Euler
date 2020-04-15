--program finding the nth prime number

is_prime::Int -> Bool --function finding if number is prime, returns Boolean
is_prime n = let factors_list = filter (\x -> rem n x == 0) [1..round(sqrt(fromIntegral n))]
    in if length factors_list == 1 then True
    else False 

next_prime::Int -> Int --function finding the next prime number using recursion
next_prime n = if (is_prime (n + 1) == True) then n + 1
    else next_prime (n + 1)

nth_number::Int -> [Int] -> Int --function returning the nth prime number 
nth_number n list_of_primes = 
    if length list_of_primes == n then 
        last list_of_primes 
    else  
        nth_number n (list_of_primes ++ [next_prime (last list_of_primes)])

main:: IO()
main = do 
    let result = nth_number 10001 [2]
    print(result)