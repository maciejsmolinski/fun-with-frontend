# FWF — Fun With Front-End

Exploring various typed compile-to-js languages by mixing them together in one project.

Languages involved:

* [PureScript](http://www.purescript.org/)
* [TypeScript](https://www.typescriptlang.org/)
* [ReasonML](https://reasonml.github.io/)

```js
import PureScript from '../output/Main';
import TypeScript from './Main.ts';
import ReasonML from './Main.re';

TypeScript.main();
ReasonML.main();
PureScript.main();
```

## Installation instructions

```
npm install
npm run bower install
```

## Running the project

Run the following command to continuously build PureScript code in the background, compile the Reason/TypeScript/JavaScript code in the foreground and serve the end result under [`http://localhost:1234`](http://localhost:1234):

* `npm run watch`


## Some Examples

Writing tests:

```purescript
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

```

JSON serialization:

```purescript
module Todos (fromJSON, toJSON, Todos) where

import Data.Either (Either)
import Data.List.Types (NonEmptyList)
import Foreign (ForeignError)
import Simple.JSON (writeJSON)
import Simple.JSON as SimpleJSON

type Todos = Array { title :: String, completed :: Boolean }

fromJSON :: String -> Either (NonEmptyList ForeignError) Todos
fromJSON = SimpleJSON.readJSON

toJSON :: Todos -> String
toJSON todos = writeJSON todos
```

Working with DOM:

```purescript
module Location (getPathName, setPathName) where

import Prelude

import Effect (Effect)
import Web.HTML (window)
import Web.HTML.Location (pathname, setPathname)
import Web.HTML.Window (location)

getPathName :: Effect String
getPathName = window >>= location >>= pathname

setPathName :: String -> Effect Unit
setPathName path = window >>= location >>= setPathname path
```
