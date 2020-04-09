--adding the multiples of 3 and 5 
--this main program is supposed to return the sum of all multiples of 3 and 5 
--below 1000

main :: IO()
main = do
    let myList = filter (\x -> rem x 3 == 0 && rem x 5 == 0 || rem x 3 == 0 || rem x 5 == 0) [1..999]
    let result = foldl (\x y -> x + y) 0 myList
    print result
