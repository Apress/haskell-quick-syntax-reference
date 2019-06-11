data MyType = MyType {stringVal :: String, intVal :: Integer}

instance Eq MyType where 
      (MyType s1 i1) == (MyType s2 i2) = (s1 == s2) && (i1 == i2)


data Animal = Cat | Dog | Parrot

instance Eq Animal where  
  Cat == Cat = True  
  Dog == Dog = True  
  Parrot == Parrot = True  
  _ == _ = False

instance Show Animal where  
  show Cat = "In ancient times cats were worshipped as gods; they have not forgotten this."  
  show Dog = "It is Human's best friend."  
  show Parrot = "It repeats everything you say."


{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
class Eq b => Set a b where
  add :: a -> b -> a
  isElem :: a -> b -> Bool

instance Eq c => Set [c] c where
  add = flip (:)
  isElem = flip elem


case maybeExample of
    Nothing -> "This is the Noting constructor."
    Just a -> "This is the Just constructor, with value " ++ (show a)
