import qualified Data.ByteString.Lazy as BL
import Data.Binary.Get
import Data.Word

deserialiseHeader :: Get (Word32, Word32, Word32)
deserialiseHeader = do
  alen <- getWord32be
  plen <- getWord32be
  chksum <- getWord32be
  return (alen, plen, chksum)

main :: IO ()
main = do
  input <- BL.getContents
  print $ runGet deserialiseHeader input
listOfWord16 = do
  empty <- isEmpty
  if empty
     then return []
     else do v <- getWord64be
             rest <- listOfWord16
             return (v : rest)
			 
			 
			 
import qualified Data.ByteString as B
import Data.Binary.Strict.Get
import Data.Word

deserialiseHeader :: Get (Word32, Word32, Word32)
deserialiseHeader = do
  alen <- getWord32be
  plen <- getWord32be
  chksum <- getWord32be
  return (alen, plen, chksum)
main :: IO ()
main = do
  input <- B.getContents
  print $ runGet deserialiseHeader input
