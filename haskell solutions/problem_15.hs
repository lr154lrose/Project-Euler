--Program counting all the shortest paths from a corner of a grid up to the diagonally opposite one
--A grid will be N x M with the shortest path of sum N + M 

count_shortest::Int -> Int -> Integer 
count_shortest n m = factorial (toInteger(n + m)) `div` (factorial (toInteger m)) `div` (factorial (toInteger n))


factorial::Integer -> Integer --function finding the factorial of a number 
factorial number = foldr (\x y -> x*y) 1 [1..number]


main::IO()
main = do 
    let result = map (\x -> factorial x) [1..20]
    print(result)
