module Test.Orchestrator (main) where

import Prelude

import Orchestrator (executable, makeCommand)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

main :: Spec Unit
main = do
  describe "Orchestrator" do
    describe "executable" do

      it "should return the program with no args" do
        executable (makeCommand "git" []) `shouldEqual` "git"

      it "should return the program with args separated by spaces" do
        executable (makeCommand "git" ["reset", "HEAD", "--hard"]) `shouldEqual` "git reset HEAD --hard"
