module Test.App (main) where

import Prelude

import App (Route(..), toRoute)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

main :: Spec Unit
main = do
  describe "App" do
    describe "toRoute" do
      it "should return Contact for /contact" do
        (toRoute "/contact") `shouldEqual` Contact
      it "should return Home for /" do
        (toRoute "/") `shouldEqual` Home
      it "should return NotFound for any other route" do
        (toRoute "/test") `shouldEqual` NotFound
        (toRoute "/another-test") `shouldEqual` NotFound
