module Main where

import Effect (Effect)
import Effect.Console (log)
import Prelude ((<>), ($), Unit, discard)

data Kind = Welcoming | Neutral

welcome :: Kind -> String -> String
welcome Welcoming name = "Heyy " <> name <> "!"
welcome Neutral name = "Mhm, hey " <> name

welcoming :: String -> String
welcoming = welcome Welcoming

neutral :: String -> String
neutral = welcome Neutral


print :: String -> Effect Unit
print msg = log $ "[PS] " <> msg

main :: Effect Unit
main = do
  print $ welcoming "Stewart"
  print $ neutral "Stewart"
