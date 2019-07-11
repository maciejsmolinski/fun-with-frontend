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
