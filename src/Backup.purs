module Backup  where

import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (Either)
import Data.Generic.Rep (class Generic)
import Data.List.Types (NonEmptyList)
import Effect (Effect)
import Effect.Console (log)
import Foreign (ForeignError)
import Foreign.Class (class Decode, class Encode)
import Foreign.Generic (decodeJSON, defaultOptions, encodeJSON, genericDecode, genericEncode)


foreign import welcomeImpl :: String -> String

newtype Configuration = Configuration {
  endpoint :: String,
  debug :: Boolean
}

derive instance genericConfiguration :: Generic Configuration _

instance showConfiguration :: Show Configuration where
  show (Configuration { endpoint, debug }) = "(Configuration { endpoint='" <> endpoint <> "' debug=" <> show debug <>" })"

instance decodeConfiguration :: Decode Configuration where
  decode = genericDecode (defaultOptions { unwrapSingleConstructors = true })

instance encodeFormData :: Encode Configuration where
  encode = genericEncode (defaultOptions { unwrapSingleConstructors = true })

plog :: String -> Effect Unit
plog msg = log $ "[PS] " <> msg

conf :: Configuration
conf = Configuration { endpoint: "", debug: false }

conf' :: Either (NonEmptyList ForeignError) (Configuration)
conf' = runExcept $ decodeJSON $ encodeJSON conf

main :: Effect Unit
main = do
  plog "Welcome message from PureScript"
  plog $ welcome "someone"
  plog $ welcomeImpl "someoneElse"
  plog $ encodeJSON conf
  plog $ show conf'

welcome :: String -> String
welcome name = "Hey hey hey " <> name