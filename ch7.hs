add :: Integer -> Integer -> Integer   
add x y =  x + y                      

main = do 
   putStrLn "Adding two numbers:"  
   print(add 3 7)


main = putStrLn "Learning about Haskell main function"

main = do  
    putStrLn "Are you enjoying Haskell?"  
    answer <- getLine  
    putStrLn ("You answered: " ++ answer)


day :: (Integral a) => a -> String
day 1 = "Monday"
day 2 = "Tuesday"
day 3 = "Wednesday"
day 4 = "Thursday"
day 5 = "Friday"
day 6 = "Saturday"
day 7 = "Sunday"
day x = "The week has only 7 days!"


numbers :: (Integral a) => a -> String
numbers x = 
 if x < 0 then "negative"
 else "positive"


day :: (Integral a) => a -> String
day x = case x of 1 -> "Monday"
                  2 -> "Tuesday"
                  3 -> "Wednesday"
                  4 -> "Thursday"
                  5 -> "Friday"
                  6 -> "Saturday"
                  7 -> "Sunday"
                  _ -> "The week has only 7 days!"


sign :: (RealFloat a) => a -> String  
sign x  
 | x < 0     = "negative"  
 | x == 0    = "zero"  
 | otherwise = "positive"


quadraticEq :: (Float, Float, Float) -> (Float, Float)
quadraticEq (a, b, c) = (x1, x2)
 where
  x1 = (-b - sqrt delta) / (2 * a)
  x2 = (-b + sqrt delta) / (2 * a)
  delta = b * b - 4 * a * c


pyramivVol :: (RealFloat a) => a -> a -> a  
pyramivVol l h = 
 let area = l^2   
 in  (area * h)/3


5 * (let a = 2 in a^2) + 7 
[let cube x = x^3 in (cube 6, cube 3)]
(let x = 100; y = 200 in x+y, let l="Anne "; f = "Scott" in l ++ f)  


main = do 
   putStrLn "The square of 2 is:"  
   print ((\x -> x^2) 2)


let concatAndPrint a b = putStrLn $ (++) a b
concatAndPrint "abc" "def"
"abc" `concatAndPrint` "def"


multiplyList m [] = []
multiplyList m (y:ys) = m*y : multiplyList m ys

multiplyListBy3 = multiplyList 3
