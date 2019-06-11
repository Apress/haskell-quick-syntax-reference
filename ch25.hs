divide :: Float -> Float -> Float
divide x 0 = error "Cannot divide by 0"
divide x y = x / y


import System.Random

main = do
  g <- getStdGen
  print $ take 10 (randomRs ('a', 'z') g)
