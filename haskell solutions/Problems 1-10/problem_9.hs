--program finding a pythagorean triplet where the sum of it is equal to a number n 

m_loop:: Int -> Int -> [Int]
m_loop n number = 
    let mylist = map (\x -> pythagorean_triplet n x number) [n..ceiling(sqrt(fromIntegral number))]
    in filter (\x -> x /= 0) mylist

pythagorean_triplet:: Int -> Int -> Int -> Int 
pythagorean_triplet n m number = if (m*m - n*n + 2*m*n + m*m + n*n) == number then (m*m - n*n)*2*m*n*(m*m + n*n) else 0

n_loop:: Int -> [[Int]]
n_loop number = map (\x -> m_loop x number) [1..ceiling(sqrt(fromIntegral number))]

product_of_triplet::Int -> Int
product_of_triplet number = (filter (\x -> x /= []) (n_loop 1000)) !! 0 !! 0 

main:: IO()
main = do 
    let result = product_of_triplet 1000  
    print(result)