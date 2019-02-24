module Todos (fromJSON, toJSON, Todos) where

import Data.Either (Either)
import Data.List.Types (NonEmptyList)
import Foreign (ForeignError)
import Simple.JSON (writeJSON)
import Simple.JSON as SimpleJSON

type Todos = Array { title :: String, completed :: Boolean }

fromJSON :: String -> Either (NonEmptyList ForeignError) Todos
fromJSON = SimpleJSON.readJSON

toJSON :: Todos -> String
toJSON todos = writeJSON todos