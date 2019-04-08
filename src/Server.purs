module Server where

-- | pulp --watch run -m Server

import Prelude

import Data.Function.Uncurried (Fn0, Fn1, Fn2, mkFn2, runFn0, runFn1)
import Effect (Effect)

type Port = Int
type Message = String

type Request = {
  url :: String
}
type Response = {
  write :: Fn1 String (Effect Unit),
  end :: Fn0 (Effect Unit)
}
type Handler = Request -> Response -> Effect Unit

foreign import serveStaticImpl :: Port -> Message -> Effect Unit
foreign import serveDynamicImpl :: Port -> Fn2 Request Response (Effect Unit) -> Effect Unit

serveStatic :: Port -> Message -> Effect Unit
serveStatic port message = serveStaticImpl port message

serveDynamic :: Port -> Handler -> Effect Unit
serveDynamic port handler = serveDynamicImpl port $ mkFn2 handler

main :: Effect Unit
main = serveDynamic 9191 app

app ::Handler
app req res =
  case req.url of
    "/app" -> (runFn1 res.write $  "App") *> runFn0 res.end
    _ -> (runFn1 res.write $ "Requested path: " <> req.url) *> runFn0 res.end