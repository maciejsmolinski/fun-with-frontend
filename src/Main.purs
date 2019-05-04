module Main where

import Prelude

import Effect (Effect)
import Tasks as Tasks
import Todos as Todos
import Type.Data.Boolean (kind Boolean)
import App as App
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

  log $ Tasks.toJSON (Tasks.toTasks items)
  log $ show $ Tasks.fromJSON json
  log $ Todos.toJSON items
  log $ show $ Todos.fromJSON json

  App.main

  where
    items = [{ title: "Test", completed: false }]
    json = """[{ "title": "test", "completed" : false }]"""