import Control.Applicative
import Control.Monad (MonadPlus, liftM, ap)
import Control.Monad.Trans
import Control.Monad (mplus, mzero, liftM, ap)

instance Monad m => Alternative (MaybeT m) where
    empty   = MaybeT $ return Nothing
    x <|> y = MaybeT $ do maybe_value <- runMaybeT x
                          case maybe_value of
                               Nothing    -> runMaybeT y
                               Just _     -> return maybe_value

instance Monad m => MonadPlus (MaybeT m) where 
    mzero = empty
    mplus = (<|>)

instance MonadTrans MaybeT where
    lift = MaybeT . (liftM Just)





import Control.Monad.Trans.Class (lift)
import Data.Functor.Identity (Identity, runIdentity)
import Control.Monad.Trans.Reader (ReaderT, ask, runReader)
import Control.Monad.Trans.Writer (WriterT, tell, runWriter)

type DataIn = Integer
type DataOut = [String]
type Outcome = Integer

transformersStack :: WriterT DataOut (ReaderT DataIn Identity) Outcome
transformersStack = do
    y <- lift ask
    tell ["The user introduced: " ++ show y]
    return y
