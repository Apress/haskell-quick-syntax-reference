qs :: (Ord a) => [a] -> [a]
qs (y:ys) = qs [x | x <- ys, x<= y] ++ [y] ++ qs [x | x <- ys, x > y]


qs :: (Ord a) => [a] -> [a]
qs [] = []
qs (y:ys) = qs [x | x <- ys, x<= y] ++ [y] ++ -qs[x | x <- ys, x > y]


ms`splitinhalf :: [a] -> ([a], [a])
ms`splitinhalf ys = (take m ys, drop m ys)
	where m = (length ys) `div` 2
ms’splitinhalf :: [a] -> ([a], [a])
ms’splitinhalf ys = (take m ys, drop m ys)
	where m = (length ys) ‘div’ 2

ms’merge :: (Ord b) => [b] -> [b] -> [b]
ms’merge [] ys = ys
ms’merge ys [] = ys
ms’merge (y:ys) (x:xs)
	| (y < x) = y:ms’merge ys (x:xs)
	| otherwise = y:ms’merge (y:ys) ys
ms :: (Ord a) => [a] -> [a]
ms xs 	
    | (length xs) > 1 = ms'merge (ms ls) (ms rs)
    | otherwise = xs
    where (ls, rs) = ms'splitinhalf xs
ms'merge :: (Ord a) => [a] -> [a] -> [a]
ms'merge [] xs = xs
ms'merge xs [] = xs
ms'merge (x:xs) (y:ys)
    | (x < y) = x:ms'merge xs (y:ys)
    | otherwise = y:ms'merge (x:xs) ys
 
ms'splitinhalf :: [a] -> ([a], [a])
ms'splitinhalf xs = (take n xs, drop n xs)
    where n = (length xs) `div` 2 
 
ms :: (Ord a) => [a] -> [a]
ms xs 
    | (length xs) > 1 = ms'merge (ms ls) (ms rs)
    | otherwise = xs
    where (ls, rs) = ms'splitinhalf xs
bs'iter :: (Ord a) => [a] -> [a]
bs'iter (x:y:xs)
    | x > y = y : bsiter (x:xs)
    | otherwise = x : bs'iter (y:xs)
bs'iter (x) = (x)
bs :: (Ord a) => [a] -> Int -> [a]
bs xs i 
    | i == (length xs) = xs
    | otherwise = bs' (bs'iter xs) (i + 1) 
 
bs :: (Ord a) => [a] -> [a]
bs xs = bs' xs 0
