module Orchestrator (makeCommand, Command, makeApp, Config, runApp, executable, class Executable) where

import Data.Array ((:))
import Data.Foldable (foldr, traverse_)
import Data.Function (($))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Show (show)
import Data.String (trim)
import Data.Unit (Unit)
import Effect (Effect)
import Logger (log)
import Prelude (class Show, (<>), discard)

class Executable a where
  executable :: a -> String

type Program = String
type Args = Array String

data Command = Command Program Args

data Config = App { appName :: String
                  , appHash :: String
                  , dir :: String
                  , commands :: Array Command
                  }

derive instance genericCommand :: Generic Command _

derive instance genericConfig :: Generic Config _

instance showConfig :: Show Config where
  show = genericShow

instance executableCommand :: Executable Command where
  executable :: Command -> String
  executable (Command program args) = trim $ foldr (\xs x -> xs <> " " <> x) "" (program : args)

instance showCommand :: Show Command where
  show = genericShow

makeCommand :: Program -> Args -> Command
makeCommand program args = Command program args

runCommand :: Command -> Effect Unit
runCommand command = log $ "(Orchestrator/execute) " <> executable command

makeApp :: String -> Array Command -> Config
makeApp name commands = App { appName: name
                            , appHash: "****"
                            , dir: "/"
                            , commands: commands
                            }

runApp :: Config -> Effect Unit
runApp (App config) = do
  log $ "(Orchestrator/run) " <> "run app \"" <> (_.appName config) <> "\""
  traverse_ runCommand (_.commands config)
  log $ "(Orchestrator/run) done"
