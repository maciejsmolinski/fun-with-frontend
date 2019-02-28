module HttpGetFSWrite where

import Prelude

import Data.Either (Either(..))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (log)
import HttpGet (getTodosAff)
import Node.Buffer (fromString)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (writeFile)
import Todos (toJSON)

getAndWriteTodos :: Effect Unit
getAndWriteTodos = launchAff_ do
  todos <- getTodosAff
  case todos of
    Left _ -> pure unit
    Right items -> do
      buffer <- liftEffect $ fromString (toJSON items) UTF8
      liftEffect $ log "Writing to http.json"
      liftEffect $ writeFile "./http.json" buffer
      liftEffect $ log "Done writing to http.json"
