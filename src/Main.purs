module Main where

import Prelude

import App as App
import DateTime as DateTime
import Effect (Effect)
import Effect.Console as Console

class Monad m <= MonadLogger m where
  info :: String -> m Unit
  warn :: String -> m Unit
  error :: String -> m Unit

class Monad m <= MonadDateTime m where
  currentDateTime :: m String

instance monadLogger :: MonadLogger Effect where
  info :: String -> Effect Unit
  info = Console.log <<< ((<>) "[INFO] ")

  warn :: String -> Effect Unit
  warn = Console.log <<< ((<>) "[WARN] ")

  error :: String -> Effect Unit
  error = Console.error <<< ((<>) "[ERR] ")

instance monadDateTime :: MonadDateTime Effect where
  currentDateTime = DateTime.currentDateTime

application :: forall m. MonadLogger m => MonadDateTime m => m Unit
application = do
  info "Log from PureScript"
  warn "Warn from PureScript"
  error "Error from PureScript"
  currentDateTime >>= info

main :: Effect Unit
main = application *> App.main
