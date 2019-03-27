module Utils (fetch, withDefault, fetchString) where

import Prelude

import Affjax (ResponseFormatError, get)
import Affjax.ResponseFormat (string)
import Data.Either (Either, either)
import Effect.Aff (Aff)

fetch :: String -> Aff (Either ResponseFormatError String)
fetch url = _.body <$> get string url

withDefault :: forall a b. a -> Either b a -> a
withDefault default = either (const default) identity

fetchString :: String -> Aff String
fetchString url = withDefault "" <$> fetch url