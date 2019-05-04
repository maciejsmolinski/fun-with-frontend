module Location (getPathName, setPathName) where

import Prelude

import Effect (Effect)
import Web.HTML (window)
import Web.HTML.Location (pathname, setPathname)
import Web.HTML.Window (location)

getPathName :: Effect String
getPathName = window >>= location >>= pathname

setPathName :: String -> Effect Unit
setPathName path = window >>= location >>= setPathname path