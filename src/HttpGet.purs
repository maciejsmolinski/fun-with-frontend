module HttpGet where

import Prelude

import Affjax (get)
import Affjax.ResponseFormat (string)
import Data.Either (Either, either)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (logShow)
import Foreign (MultipleErrors)
import Todos (Todos, fromJSON)

getTodosAff :: Aff (Either MultipleErrors (Todos))
getTodosAff = do
  result <- get string "http://www.mocky.io/v2/5c74755f2f00002a009641c0"
  body <- pure result.body
  pure $ fromJSON $ either (const "") identity body

getTodos :: Effect Unit
getTodos = launchAff_ do
  todos <- getTodosAff
  liftEffect $ logShow todos