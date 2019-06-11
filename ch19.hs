import Control.Monad (unless)
import Pipes
import System.IO (isEOF)

stdinLn :: Producer String IO ()
stdinLn = do
    eof <- lift isEOF        -- 'lift' an 'IO' action from the base monad
    unless eof $ do
        str <- lift getLine
        yield str            -- 'yield' the 'String'
        stdinLn              -- Loop
{-# LANGUAGE DeriveGeneric #-}
module Command where
import Data.Binary
import GHC.Generics (Generic)

data Command = FirstMessage
           | DoNothing
           | DoSomething Int
           deriving (Show,Generic)

instance Binary Command
module Server where

import Pipes 
import qualified Pipes.Binary as PipesBinary
import qualified Pipes.Network.TCP as PNT
import qualified Command as C
import qualified Pipes.Parse as PP
import qualified Pipes.Prelude as PipesPrelude

pageSize :: Int
pageSize = 4096

-- pure handler, to be used with PipesPrelude.map
pureHandler :: C.Command -> C.Command 
pureHandler c = c  -- answers the same command that we have receveid

-- impure handler, to be used with PipesPremude.mapM
sideffectHandler :: MonadIO m => C.Command -> m C.Command
sideffectHandler c = do
  liftIO $ putStrLn $ "received message = " ++ (show c)
  return $ C.DoSomething 0    
  -- whatever incoming command `c` from the client, answer DoSomething 0

main :: IO ()
main = PNT.serve (PNT.Host "127.0.0.1") "23456" $
  \(connectionSocket, remoteAddress) -> do
                 putStrLn $ "Remote connection from ip = " ++ (show remoteAddress)
                 _ <- runEffect $ do
                   let bytesReceiver = PNT.fromSocket connectionSocket pageSize
                   let commandDecoder = PP.parsed PipesBinary.decode bytesReceiver
                   commandDecoder >-> PipesPrelude.mapM sideffectHandler >-> for cat PipesBinary.encode >-> PNT.toSocket connectionSocket
                   -- if we want to use the pureHandler
                   --commandDecoder >-> PipesPrelude.map pureHandler >-> for cat PipesBinary.Encode >-> PNT.toSocket connectionSocket
                 return ()
module Client where

import Pipes
import qualified Pipes.Binary as PipesBinary
import qualified Pipes.Network.TCP as PNT
import qualified Pipes.Prelude as PipesPrelude
import qualified Pipes.Parse as PP
import qualified Command as C

pageSize :: Int
pageSize = 4096

-- pure handler, to be used with PipesPrelude.amp
pureHandler :: C.Command -> C.Command 
pureHandler c = c  -- answer the same command received from the server

-- inpure handler, to be used with PipesPremude.mapM
sideffectHandler :: MonadIO m => C.Command -> m C.Command
sideffectHandler c = do
  liftIO $ putStrLn $ "Received: " ++ (show c)
  return C.DoNothing  -- whatever is received from server, answer DoNothing

main :: IO ()
main = PNT.connect ("127.0.0.1") "23456" $
  \(connectionSocket, remoteAddress) -> do
    putStrLn $ "Connected to distant server ip = " ++ (show remoteAddress)
    sendFirstMessage connectionSocket
    _ <- runEffect $ do
      let bytesReceiver = PNT.fromSocket connectionSocket pageSize
      let commandDecoder = PP.parsed PipesBinary.decode bytesReceiver
      commandDecoder >-> PipesPrelude.mapM sideffectHandler >-> for cat PipesBinary.encode >-> PNT.toSocket connectionSocket
    return ()

sendFirstMessage :: PNT.Socket -> IO ()
sendFirstMessage s = do
  _ <- runEffect $ do
    let encodedProducer = PipesBinary.encode C.FirstMessage 
    encodedProducer >-> PNT.toSocket s  
  return ()
