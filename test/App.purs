module Test.App (main) where

import Prelude

import App (Route(..), toRoute)
import Effect (Effect)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

main :: Effect Unit
main = run [consoleReporter] do
  describe "App" do
    describe "toRoute" do
      it "should return Contact for /contact" do
        (toRoute "/contact") `shouldEqual` Contact
      it "should return Home for /" do
        (toRoute "/") `shouldEqual` Home
      it "should return NotFound for any other route" do
        (toRoute "/test") `shouldEqual` NotFound
        (toRoute "/another-test") `shouldEqual` NotFound
