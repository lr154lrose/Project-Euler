--program that finds the largest product of n adjacent elements in a sequence
import Data.Char(digitToInt)

product_of_factors:: [Int] -> Int --function that returns the product of all the numbers in a list 
product_of_factors list = foldr (\x y -> x * y) 1 list

factors:: [Char] -> [Int] -> Int -> [Int] --function that uses recursion to get a list of integers of length n, from the sequnce given, the integers are adjacent in the list 
factors sequence list number = 
    if number == 1 then list
    else factors (tail sequence) (list ++ [digitToInt(head (tail sequence))]) (number - 1)
        
largest_product::[Char] -> Int -> Int -> Int --function that uses recursion to find the biggest product of n adjacent elements in a sequence of numbers 
largest_product sequence number largest = 
    if length sequence == number then max largest (product_of_factors (factors (sequence) ([digitToInt(head (sequence))]) number)) 
    else largest_product (tail sequence) number (max largest (product_of_factors (factors (sequence) ([digitToInt(head (sequence))]) number)))

largest_product_function:: [Char] -> Int -> Int
largest_product_function sequence number = largest_product sequence number 1 --calling the function above 

main::IO()
main = do 
    let result = largest_product_function "731671765313306249192251196744265747423553491949349698352031277450632623957831801698480186947885184385861560789112949495459501737953319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450" 13
    print(result)