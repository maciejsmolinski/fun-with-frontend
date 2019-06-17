module Demo (main) where

import Prelude

import Effect (Effect)
import Logger (log)

data Kind = Happy | Neutral

message :: Kind -> String -> String
message Happy name = "Heyy " <> name <> "!"
message Neutral name = "Mhm, hey " <> name <> ".."

happy :: String -> String
happy = message Happy

neutral :: String -> String
neutral = message Neutral

main :: Effect Unit
main = do
  log $ happy "Stewart"
  log $ neutral "Stewart"
