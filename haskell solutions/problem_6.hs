--program returning the difference between the square sum and the sum of squares of the firs n natural numbers

sum_of_squares::Int -> Int
sum_of_squares n = foldr (\x y -> x*x + y) 0 [1..n]

square_of_sum::Int -> Int
square_of_sum n = 
    let sum = foldr (\x y -> x + y) 0 [1..n]
    in sum^2

difference::Int -> Int
difference n = square_of_sum n - sum_of_squares n

main:: IO()
main = print(difference 100)