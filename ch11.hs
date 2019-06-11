data MyData = Zero | Double Int

g :: MyData -> Int
g Zero = 0
g (Double x) = 2*x


associate :: Eq a => a -> [(a, t)] -> [t]
associate character xs = [y | (x,y) <- xs , x == character]
