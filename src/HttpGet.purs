module HttpGet (getTodosAff) where

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
  result <- _.body <$> get string "http://www.mocky.io/v2/5c74755f2f00002a009641c0"
  pure $ fromJSON $ either (const "") identity result

getAndLogTodos :: Effect Unit
getAndLogTodos = launchAff_ do
  todos <- getTodosAff
  liftEffect $ logShow todos

