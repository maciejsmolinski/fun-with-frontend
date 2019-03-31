module Server (serve) where

import Prelude
import Effect (Effect)

type Port = Int
type Message = String

foreign import serveImpl :: Port -> Message -> Effect Unit

serve :: Port -> Message -> Effect Unit
serve port message = serveImpl port message
