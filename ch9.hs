let set = [x | x <- [5..10]]
set
[x | x <- [100..200], x `mod` 17 == 0]
[x | x <- [100..200], x `mod` 17 == 0, x`mod` 10 == 0]
[x | x <- [100..200], x `mod` 17 == 0 && x`mod` 10 == 0]
[ x+y | x <- [1,7,12], y <- [5,9,14]]
[ x+y | x <- [1,7,12], y <- [5,9,14,17]]
[ x+y | x <- [1,7,12], y <- [5,9,14,17], x+y >20]
let l1 = ["my", "your"]
let l2 = ["book", "pencil", "PC"]
[elem1 ++ " " ++ elem2 | elem1 <- l1, elem2 <- l2]
let numbers = [1,3..100]
[0 | _ <- numbers]
parity list = [ if x `mod` 2 == 0 then "even" else "odd" | x <- list, x >= 0]
parity [-100,-97..25]
parity list = [ if x `mod` 2 == 0 then show x ++ " even" else show x ++ " odd" | x <- list, x >= 0]   
parity [-100,-97..25]
map :: (a -> b) -> [a] -> [b]

double :: Integer -> Integer
double x = 2*x


check :: Integer -> Bool
check x =
  x `mod` 2 == 0 && x > 20
  
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (y:ys) = (qsort ls) ++ [y] ++ (qsort gt)
    where
        ls  = filter (< y) ys
        gt = filter (>= y) ys
