--program finding the smallest common multiple of all the numbers in a given range


factors:: Int -> [Int] --function getting all the prime factors of a number 
factors m = f m (head primes) (tail primes) where
  f m n ns
    | m < 2 = []
    | m `mod` n == 0 = n : f (m `div` n) n ns
    | otherwise = f m (head ns) (tail ns)

primes:: [Int]
primes = f [2..] where f (p : ns) = p : f [n | n <- ns, n `mod` p /= 0]

counting:: Int -> [Int] -> Int --counting the occurences of an element in a list 
counting number list = 
  let occurences = filter (\x -> x == number) list
  in length occurences --returning length of that list  

helper:: [Int] -> [Int] -> [Int] --function taking two lists, the first one containing all the prime factors up to this point 
helper returnList iteratableList = 
  if length iteratableList == 0 then --if the length is 0 then return 
    returnList
  else if counting (head iteratableList) returnList < counting (head iteratableList) iteratableList --only adding a prime number if the number of occurences in the returnList is smaller since we're following the division method
    then do 
      let returnList1 = returnList ++ [(head iteratableList)] 
      helper returnList1 (iteratableList) 
  else helper returnList (tail iteratableList) 


loop:: [Int] -> [Int] -> [Int] --loop iterating through all the numbers in the given range and adding the prime factors to a list
loop range list_of_factors = 
  if length range == 1  
    then list_of_factors --returning list of prime factors of every number in the range following the division method
  else do 
    loop (tail range) (helper list_of_factors (factors (head (tail range))))

division_method:: [Int] -> Int --function returns the smallest common multiple of all the numbers in the range given as input 
division_method range_of_numbers = 
  let factors_of_multiple = loop range_of_numbers []
  in foldl (\x y -> x * y) 1 factors_of_multiple --multiplicating all the elements of the list containing the prime numbers 

main:: IO()
main = do 
    let result = division_method [1..10]
    print(result)