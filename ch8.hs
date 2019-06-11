fact 0 = 1
fact n = n * fact (n - 1)


fact 0 = 1
fact n | n > 0 = n * fact (n - 1)
       | otherwise = error "Wrong input"


recursiveReverse :: [a] -> [a]
recursiveReverse [] = []
recursiveReverse (x:xs) = recursiveReverse xs ++ [x]


recursiveFilter :: (a -> Bool) -> [a] -> [a]
recursiveFilter condition []    = []
recursiveFilter condition (x:xs)
  	| condition x         = x : recursiveFilter condition xs
  	| otherwise      = recursiveFilter condition xs


recursiveLength :: [a] -> Int           
recursiveLength [] = 0                  
recursiveLength (x:xs) = 1 + recursiveLength xs  

recursiveReverse :: [a] -> [a]
recursiveReverse [] = []
recursiveReverse (x:xs) = recursiveReverse xs ++ [x]

recursiveRepeat :: a -> [a]  
recursiveRepeat x = x:recursiveRepeat x 

recursiveMaximum :: (Ord a) => [a] -> a  
recursiveMaximum [] = error "Empty list"  
recursiveMaximum [x] = x  
recursiveMaximum (x:xs) = max x (recursiveMaximum xs)  

recursiveMinimum :: [Int] -> Int
recursiveMinimum (x:[]) = x
recursiveMinimum (x:xs) = x `min` recursiveMinimum xs

recursiveTake :: (Num i, Ord i) => i -> [a] -> [a]  
recursiveTake n _  
    | n <= 0   = []  
recursiveTake _ []     = []  
recursiveTake n (x:xs) = x : recursiveTake (n-1) xs 

recursiveElem :: (Eq a) => a -> [a] -> Bool  
recursiveElem a [] = False  
recursiveElem a (x:xs)  
    | a == x    = True  
    | otherwise = a `elem` xs
recursiveFunction [] = -- this is the edge condition
recursiveFunction (x:xs) = -- this is the general case

recursiveReverse :: [a] -> [a]
recursiveReverse [] = []
recursiveFunction (x:xs) = function x recursiveFunction xs
recursiveFunction (x:xs) = recursiveFunction xs function x
recursiveFunction (x:xs) = x `function` recursiveFunction xs
