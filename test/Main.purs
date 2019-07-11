module Test.Main where

import Prelude

import Effect (Effect)
import Test.App as AppSpec
import Test.Demo as DemoSpec
import Test.Orchestrator as OrchestratorSpec
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

main :: Effect Unit
main = run [consoleReporter] do
  AppSpec.main
  DemoSpec.main
  OrchestratorSpec.main
