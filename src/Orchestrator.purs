module Orchestrator (makeCommand, Command, executable, class Executable) where

import Data.Array ((:))
import Data.Foldable (foldr)
import Data.Function (($))
import Data.Show (show)
import Data.String (trim)
import Prelude (class Show, (<>))

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

instance executableCommand :: Executable Command where
  executable :: Command -> String
  executable (Command program args) = trim $ foldr (\xs x -> xs <> " " <> x) "" (program : args)

instance showCommand :: Show Command where
  show :: Command -> String
  show command = "Command (" <> executable command  <> ")"

instance showConfig :: Show Config where
  show :: Config -> String
  show (App opts) = "Config (App ("
                    <> "\n  appName=" <> _.appName opts <> ","
                    <> "\n  appHash=****" <> ","
                    <> "\n  dir=" <> _.dir opts <> ","
                    <> "\n  commands=" <> show (_.commands opts)
                    <> "\n))"

makeCommand :: Program -> Args -> Command
makeCommand program args = Command program args
