module ReadWrite where

import Prelude

import Data.Either (Either)
import Data.List.Types (NonEmptyList)
import Effect (Effect)
import Foreign (ForeignError)
import Node.Buffer (fromString, toString)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (readFile, writeFile)
import Todos as Todos

todos :: Todos.Todos
todos = [{ title: "Test 1", completed: false }, { title: "Test 2", completed: true }]

write :: Effect Unit
write = do
  todosString <- fromString (Todos.toJSON todos) UTF8
  writeFile "./todos.json" todosString

read :: Effect (Either (NonEmptyList ForeignError) Todos.Todos)
read = do
  todosString <- readFile "./todos.json" >>= toString UTF8
  pure $ Todos.fromJSON todosString
