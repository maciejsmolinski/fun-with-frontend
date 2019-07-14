module Orchestrator (makeCommand, Command, makeApp, App, runApp, executable, class Executable) where

import Data.Array ((:))
import Data.Foldable (foldr, traverse_)
import Data.Function (($))
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.String (toLower, trim)
import Data.Unit (Unit)
import Effect (Effect)
import Logger as Logger
import Prelude (class Show, discard, show, (<<<), (<>))

class Executable a where
  executable :: a -> String

type Program = String
type Args = Array String

data Phase = Run | Execute

data Command = Command Program Args

data App = App { appName :: String
               , appHash :: String
               , dir :: String
               , commands :: Array Command
               }

derive instance genericPhase :: Generic Phase _

derive instance genericCommand :: Generic Command _

derive instance genericApp :: Generic App _

instance showPhase :: Show Phase where
  show = toLower <<< genericShow

instance showApp :: Show App where
  show = genericShow

instance executableCommand :: Executable Command where
  executable :: Command -> String
  executable (Command program args) = trim $ foldr (\xs x -> xs <> " " <> x) "" (program : args)

instance showCommand :: Show Command where
  show = genericShow

makeCommand :: Program -> Args -> Command
makeCommand program args = Command program args

runCommand :: Command -> Effect Unit
runCommand command = logExecute (executable command)

makeApp :: String -> Array Command -> App
makeApp name commands = App { appName: name
                            , appHash: "****"
                            , dir: "/"
                            , commands: commands
                            }

runApp :: App -> Effect Unit
runApp (App config) = do
  logRun $ "run app \"" <> config.appName <> "\""
  traverse_ runCommand config.commands
  logRun "done"

log :: Phase -> String -> Effect Unit
log kind msg = Logger.log $ "(Orchestrator/" <> (show kind) <> ") " <> msg

logRun :: String -> Effect Unit
logRun = log Run

logExecute :: String -> Effect Unit
logExecute = log Execute
