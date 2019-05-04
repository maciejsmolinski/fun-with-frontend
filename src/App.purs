module App where

import Prelude

import Effect (Effect)
import History as History
import Location as Location
import Logger as Logger

data Route = Home | NotFound

toRoute :: String -> Route
toRoute "/" = Home
toRoute _ = NotFound

render :: Route -> Effect Unit
render =
  case _ of
    Home -> Logger.log "Home Route"
    NotFound -> Logger.log "Route Not Found"

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

