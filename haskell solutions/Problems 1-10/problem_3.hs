--returning the biggest prime factor of a number


factors:: Int -> [Int]
factors n = filter (\x -> rem n x == 0) [1..round((fromIntegral n)/2)]

prime_factors:: [Int] -> [Int]
prime_factors myList = filter (\x -> is_prime x == True) myList

is_prime:: Int -> Bool
is_prime n = if length (filter (\x -> rem n x == 0) [1..round(sqrt(fromIntegral n))]) == 1 
    then True 
    else False

main:: IO()
main = do
    let factors_list = factors 5143
    let prime_factors_list = prime_factors factors_list
    let biggest_prime = last prime_factors_list
    print biggest_prime