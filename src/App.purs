module App where

import Data.Maybe (fromJust, isJust)
import Effect (Effect)
import History as History
import Location as Location
import Logger as Logger
import Partial.Unsafe (unsafePartial)
import Prelude
import Web.DOM.Document as Document
import Web.DOM.Element as Element
import Web.DOM.Node (appendChild, setTextContent)
import Web.HTML as HTML
import Web.HTML.HTMLDocument as HTMLDocument
import Web.HTML.HTMLElement as HTMLElement
import Web.HTML.Window as Window

data Route = Home | Contact | NotFound

instance showRoute :: Show Route where
  show Home = "Home"
  show Contact = "Contact"
  show NotFound = "NotFound"

derive instance eqRoute :: Eq Route

toRoute :: String -> Route
toRoute "/" = Home
toRoute "/contact" = Contact
toRoute _ = NotFound

render :: Route -> Effect Unit
render =
  case _ of
    Home -> renderText "Home Route" *> Logger.log "Home route reached"
    Contact -> renderText "Contact Route" *> Logger.log "Contact route reached"
    NotFound -> renderText "Route Not Found" *> Logger.log "Not Found route reached"

type App = { onRoute :: String -> Effect Unit }

createApp :: App -> Effect Unit
createApp app = do
  path <- Location.getPathName
  app.onRoute path

main :: Effect Unit
main = createApp { onRoute }
 where
   onRoute = case _ of
      "/redirect" -> History.setPathName "/" *> main
      other -> render $ toRoute other

renderText :: String -> Effect Unit
renderText text = unsafePartial do
  documentEl <- HTML.window >>= Window.document
  maybeBodyEl <- HTMLDocument.body documentEl
  when (isJust maybeBodyEl) do
    let bodyEl = fromJust maybeBodyEl
    divEl <- Document.createElement "div" (HTMLDocument.toDocument documentEl)
    setTextContent text (Element.toNode divEl)
    void $ appendChild (Element.toNode divEl) (HTMLElement.toNode bodyEl)
