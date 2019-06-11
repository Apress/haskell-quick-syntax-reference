 ("first", "second", "third")
 :t ("first", "second", "third")
 (1, "apple", pi, 7.2)
 :t (1, "apple", pi, 7.2)
 ("True", 2)
 :t ("True", 2)
 (True, 2)
 :t (True, 2)
 (5, 'a', (2.3, False, "abc", 4))
 :t (5, 'a', (2.3, False, "abc", 4))
 (3.2, 5.7)
 
 let point = (3.2, 5.7)
 fst point
 snd point
 
 import Data.Tuple
 let point = (3.2, 5.7)
 swap point
 let pointA = (2.4, 6)
 let pointB = (-7, 3.5)
 d = sqrt ((fst pointA - fst pointB)^2 + (snd pointA - snd pointB)^2)
 d
