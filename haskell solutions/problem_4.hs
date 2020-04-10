--program finding the biggest palindrome made of the product of 3-digit numbers

is_palindrome:: [Int] -> Bool --this function takes a list of integers and returns True or False whethter it's a list containing a palindrome
is_palindrome myList = 
    let digits_matching = filter (\x -> myList !! x == reverse(myList) !! x) [0..length myList - 1]
    in if length digits_matching == length myList then True
    else False
    
int_to_digits_list:: Int -> [Int] --this function as parameter a number and returns a list of its digits 
int_to_digits_list n = 
    let string_list = map (\x -> [] ++ [(show n) !! x]) [0..length (show n) - 1]
    in map read string_list :: [Int]

biggest_palindrome:: Int --function that is just an action returning the biggest palindrome made of 3-digit numbers
biggest_palindrome = 
    let list = filter (\z -> is_palindrome(int_to_digits_list(z)) == True) [x * y | x <- [100..999], y <- [100..999]] --creating the list of palindromes 
    in foldl (\x y -> max x y) 0 list --returning the biggest number in the list
 
main:: IO()
main = do 
    let result = biggest_palindrome 
    print result 
    