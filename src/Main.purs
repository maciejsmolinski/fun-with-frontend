module Main  where

import Prelude

import Effect (Effect)
import Effect.Console (log)


plog :: String -> Effect Unit
plog msg = log $ "[PS] " <> msg

main :: Effect Unit
main = do
  plog "Hello sailor!"
  plog $ welcome "someone"

welcome :: String -> String
welcome name = "Hey hey hey " <> name
