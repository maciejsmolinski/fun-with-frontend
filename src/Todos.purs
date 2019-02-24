module Todos (fromJSON, toJSON) where

import Data.Either (Either)
import Data.List.Types (NonEmptyList)
import Foreign (ForeignError)
import Simple.JSON (writeJSON)
import Simple.JSON as SimpleJSON

type Todos = Array { title :: String, completed :: Boolean }
type App = { todos :: Todos }

fromJSON :: String -> Either (NonEmptyList ForeignError) Todos
fromJSON = SimpleJSON.readJSON

toJSON :: Todos -> String
toJSON todos = writeJSON todos

-- import Prelude
-- import Todos as Todos
-- Todos.fromJSON """[{ "title": "test", "completed" : false }]"""
-- Todos.toJSON [{ title: "test", completed: false }]