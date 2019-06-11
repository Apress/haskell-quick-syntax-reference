plus = \ a -> (\ b -> a + b)
plus :: Int -> Int -> Int
factorial = \ n -> if n==1 then 1 else n*factorial(n-1)
factorial :: Int -> Int

plus = \ a b -> a + b
plus :: int -> int -> int


plus a b = a + b


comp m n = (\ a -> m(n a))
comp :: (b -> c) -> (d -> e) -> d -> e
ff = (\ a -> a*a) `comp` (\ a -> a+a)
ff :: Integer -> Integer


mkpair1 :: forall a b. a -> b -> (a,b)
mkpair1 aa bb = (ida aa, bb)
    where
      ida :: a -> a -- This refers to a in the function's type signature
      ida = id
 
mkpair2 :: forall a b. a -> b -> (a,b)
mkpair2 aa bb = (ida aa, bb)
    where
      ida :: b -> b -- Illegal, because refers to b in type signature
      ida = id
 
mkpair3 :: a -> b -> (a,b)
mkpair3 aa bb = (ida aa, bb)
    where
      ida :: b -> b -- Legal, because b is now a free variable
      ida = id



is_even = 
let {is_even n = n == 0 || n > 0 && is_odd(n-1); 
is_odd n = n == 1 || n > 1 && is_even(n-1)} 
in is_even 
is_even:: Integer -> Bool

is_even' = is_even where 
{is_even n = n == 0 || n > 0 && is_odd(n-1); 
is_odd n = n == 1 || n > 1 && is_even(n-1)}



