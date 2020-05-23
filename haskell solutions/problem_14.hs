-- Program finding starting number (under one million) which
-- produces the longest Collatz sequence

import Data.List            --import library in order to use "elemIndices" which returns [Int] of the index of a certain element in a list 

collatz::Int -> Int -> Int  --recursive function adding one every time the function is called in order to add up the numbers in the sequence
collatz number length_sequence = 
    if rem number 2 == 0 
        then collatz (number `div` 2) (length_sequence + 1)
    else if number == 1
        then length_sequence + 1
    else collatz (3*number + 1) (length_sequence + 1)

compute::Int -> Int
compute number = 
    let sequence = map (\x -> collatz x 0) [1..number]  --applying function to every number up to a million
    in (elemIndices (foldr (\x y -> max x y) 0 sequence) (sequence)) !! 0 + 1 --return index which corresponds to number with biggest collatz sequence


main::IO()
main = do 
    let result = compute 1000000
    print(result)
