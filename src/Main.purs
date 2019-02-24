module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Tasks (fromJSON, toJSON, toTasks)
import Type.Data.Boolean (kind Boolean)

data Kind = Happy | Neutral

message :: Kind -> String -> String
message Happy name = "Heyy " <> name <> "!"
message Neutral name = "Mhm, hey " <> name <> ".."

happy :: String -> String
happy = message Happy

neutral :: String -> String
neutral = message Neutral

print :: String -> Effect Unit
print msg = log $ "[PS] " <> msg

main :: Effect Unit
main = do
  print $ happy "Stewart"
  print $ neutral "Stewart"
  print $ toJSON tasks
  print $ show $ fromJSON $ toJSON tasks
  where
    tasks = toTasks [{ title: "Test", completed: false }]