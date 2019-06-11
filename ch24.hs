{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE MultiParamTypeClasses #-}
import Yesod
data HelloWorld = HelloWorld
mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
|]
instance Yesod HelloWorld 
getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet|Hello There World!|]
main :: IO ()
main = warp 3000 HelloWorld
