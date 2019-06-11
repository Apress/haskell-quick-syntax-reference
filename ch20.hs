data Transaction =
    Withdrawal {amount :: Int}
    | Deposit {amount :: Int }
  deriving Show
  
simpleTransactions :: Traversal' [Transaction] Transaction
simpleTransactions = traverse

typeChangingTransactions :: Traversal [Transaction] [result] Transaction result
typeChangingTransactions = traverse

isoExample :: Iso' (Maybe a) (Either () a)

