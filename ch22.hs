main = print (fib 30)
fib n = if n < 2 then 1 else fib (n-1) + fib (n-2)
import Weigh


main :: IO ()
main =
  mainWith
    (do func "integers count 0" count 0
        func "integers count 1" count 1
        func "integers count 10" count 10
        func "integers count 100" count 100)
  where
    count :: Integer -> ()
    count 0 = ()
    count a = count (a - 1)
