module Test.Demo (main) where

import Prelude

import Demo (Kind(..), message)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

main :: Spec Unit
main = do
  describe "Demo" do
    describe "message" do
      it "should return 'Heyy <name>!' Happy message" do
        (message Happy "name") `shouldEqual` "Heyy name!"
      it "should return 'Mhm, hey <name>..' Neutral message" do
        (message Neutral "name") `shouldEqual` "Mhm, hey name.."
