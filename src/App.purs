module App where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import History as History
import Location as Location

print :: String -> Effect Unit
print msg = log $ "[PS] " <> msg

data Route = Home | NotFound

toRoute :: String -> Route
toRoute "/" = Home
toRoute _ = NotFound

render :: Route -> Effect Unit
render =
  case _ of
    Home -> renderHome
    NotFound -> renderNotFound
  where
    renderHome :: Effect Unit
    renderHome = print "Home Route"

    renderNotFound :: Effect Unit
    renderNotFound = print "Route Not Found"

type App = { onRoute :: String -> Effect Unit }

createApp :: App -> Effect Unit
createApp app = do
  path <- Location.getPathName
  app.onRoute path

main :: Effect Unit
main = createApp { onRoute }
 where
   onRoute = case _ of
      "/redirect" -> History.setPathName "/"
      other -> render $ toRoute other

