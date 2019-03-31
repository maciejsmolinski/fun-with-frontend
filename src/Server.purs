module Server (serve, serve') where

import Prelude

import Data.Function.Uncurried (Fn2, mkFn2)
import Effect (Effect)

type Port = Int
type Message = String

type Request = {}
type Response = {
  end :: String -> Effect Unit
}
type Handler = Fn2 Request Response (Effect Unit)

foreign import serveStatic :: Port -> Message -> Effect Unit
foreign import serveDynamic :: Port -> Handler -> Effect Unit

serve :: Port -> Message -> Effect Unit
serve port message = serveStatic port message

serve' :: Port -> Message -> Effect Unit
serve' port message = serveDynamic port (mkFn2 handler)
  where
    handler _ res = res.end message