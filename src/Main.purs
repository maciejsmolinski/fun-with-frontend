module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Tasks as Tasks
import Todos as Todos
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

  print $ Tasks.toJSON (Tasks.toTasks items)
  print $ show $ Tasks.fromJSON json
  print $ Todos.toJSON items
  print $ show $ Todos.fromJSON json

  where
    items = [{ title: "Test", completed: false }]
    json = """[{ "title": "test", "completed" : false }]"""