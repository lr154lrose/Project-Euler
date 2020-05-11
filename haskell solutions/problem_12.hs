--Program finding the first triangle number with more than n divisors 
--Example: the 7th triangle number is = 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28
--So, the nth number is equal to n*(n + 1)/2

number_of_divisors:: Int -> Int     --function returning the number of factors of a number 
number_of_divisors n  = 
    let list = filter (\x -> rem n x == 0) [1..round(sqrt(fromIntegral n))]
    in 2*(length list)

triangle_number:: Int -> Int -> Int --recursive function returning the first triangle number with more than n divisors
triangle_number n divisors = 
    if number_of_divisors (n*(n + 1) `div` 2) >= divisors 
        then (n*(n + 1) `div` 2)
    else triangle_number (n + 1) divisors

compute:: Int -> Int 
compute n = triangle_number 1 n

main:: IO()
main = do 
    let result = compute 500
    print(result)