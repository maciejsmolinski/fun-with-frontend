module History (setPathName) where

import Prelude

import Effect (Effect)
import Foreign (Foreign, unsafeToForeign)
import Web.HTML (window)
import Web.HTML.History (DocumentTitle(..), URL(..), pushState)
import Web.HTML.Window (history)

setPathName :: String -> Effect Unit
setPathName path = do
  window >>= history >>= pushState state title url
  where
    state :: Foreign
    state = unsafeToForeign {}

    title :: DocumentTitle
    title = DocumentTitle ""

    url :: URL
    url = URL path


