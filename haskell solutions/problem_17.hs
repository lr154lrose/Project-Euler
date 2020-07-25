--Program that adds up the letters from numbers in the range 1-1000
--Spaces and hyphens don't cound and the numbers are written in compliance with the British usage
--ex: 342 - three hundred and forty-two has 23 letters

one_digit = [0, 3, 3, 5, 4, 4, 3, 5, 5, 4]      -- from 0 to 9
teens = [3, 6, 6, 8, 8, 7, 7, 9, 8, 8]          -- from 10 to 19
tens = [0, 0, 6, 6, 5, 5, 5, 7, 6, 6]           -- 20, 30, ..., 90

_and = 3
thousand = 8
hundred = 7

calculate_hundreds::Int -> Int
calculate_hundreds number = 
    if (number `rem` 100) `div` 10 == 0 && (number `rem` 100) `rem` 10 == 0 --ex: 100, 200, 300
        then one_digit !! (number `div` 100) + hundred
    else if (number `rem` 100) `div` 10 == 1                                --ex: 110, 111, ..., 119
        then one_digit !! (number `div` 100) + hundred + _and + teens !! ((number `rem` 100) `rem` 10)
    else one_digit !! (number `div` 100) + hundred + _and + tens !! ((number `rem` 100) `div` 10) + one_digit !! ((number `rem` 100) `rem` 10)                                            --this is for everything else


compute::Int -> Int -> Int
compute n m = 
    let result_list = map (\x -> if x < 10 then one_digit !! (x `rem` 10)
                    else if x == 10 then 3
                    else if x < 20 then teens !! (x `rem` 10)
                    else if x < 100 then tens !! (x `div` 10) +  one_digit !! (x `rem` 10)
                    else calculate_hundreds x) [n..m]
    in sum result_list

main::IO()
main = do 
    let result = (compute 1 999) + 11       --plus one thousand 
    print result
