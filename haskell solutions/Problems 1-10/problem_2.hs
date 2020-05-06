--adding the even-valued numbers in the Fibonacci sequence

fib:: Int-> Int 
fib x = if x == 2 then 2 else if x == 1 then 1 else fib(x-1) + fib(x-2)

main:: IO()
main = do 
    let fibList = map fib [1..32]
    let evenList = filter (\x -> rem x 2 == 0) fibList
    let result = foldl (\x y -> x + y) 0 evenList
    print result