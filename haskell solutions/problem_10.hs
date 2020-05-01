--program finding the sum of all prime numbers smaller than a given number n 

is_prime::Int -> Bool --function finding if number is prime, returns Boolean
is_prime n = let factors_list = filter (\x -> rem n x == 0) [1..round(sqrt(fromIntegral n))]
    in if length factors_list == 1 then True
    else False 

prime_sum::Int -> Int
prime_sum n = foldr (\x y -> if is_prime x == True then x + y else y) 0 [2..n]

main:: IO()
main = do 
    let result = prime_sum 2000000
    print(result)