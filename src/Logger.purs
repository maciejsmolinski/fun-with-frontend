module Logger (log) where

import Prelude

import Effect (Effect)
import Effect.Console as Console

log :: String -> Effect Unit
log msg = Console.log $ "[PS] " <> msg