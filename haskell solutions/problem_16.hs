--Program finding the sum of the digits of a power of 2

power_of_two::Integer -> Integer
power_of_two number = 2^number

sum_of_digits::Integer -> Int
sum_of_digits number = 
    let list_digits = map (\x -> read [x] :: Int) (show number)
    in sum list_digits

main::IO()
main = do 
    let result = sum_of_digits (power_of_two (toInteger 1000))
    print(result)
