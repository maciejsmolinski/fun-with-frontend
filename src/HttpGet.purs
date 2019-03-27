module HttpGet (getTodosAff, getAndLogTodos) where

import Prelude

import Data.Either (Either)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (logShow)
import Foreign (MultipleErrors)
import Todos (Todos, fromJSON)
import Utils (fetchString)

getTodosAff :: Aff (Either MultipleErrors (Todos))
getTodosAff = do
  fromJSON <$> fetchString "http://www.mocky.io/v2/5c74755f2f00002a009641c0"

getAndLogTodos :: Effect Unit
getAndLogTodos = launchAff_ do
  todos <- getTodosAff
  liftEffect $ logShow todos