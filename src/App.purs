module App where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Location as Location
import History as History

data Route = Home | NotFound

print :: String -> Effect Unit
print msg = log $ "[PS] " <> msg

route :: String -> Route
route "/" = Home
route _ = NotFound

redirect :: Route -> Effect Unit
redirect Home = History.setPathName "/"
redirect _ = pure unit

render :: Route -> Effect Unit
render Home = renderHome
render NotFound = renderNotFound

renderHome :: Effect Unit
renderHome = do
  print "Home Route"

renderNotFound :: Effect Unit
renderNotFound = do
  print "Route Not Found"

main :: Effect Unit
main = do
  path <- Location.getPathName
  case path of
    "/redirect" -> redirect Home
    other -> render $ route other