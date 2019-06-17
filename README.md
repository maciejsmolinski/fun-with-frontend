# FWF — Fun With Front-End

Exploring various typed compile-to-js languages by mixing them together in one project.

Languages involved:

* [PureScript](http://www.purescript.org/)
* [TypeScript](https://www.typescriptlang.org/)
* [ReasonML](https://reasonml.github.io/)

## Installation instructions

```
npm install
npm run bower install
```

## Running the project

Run the following to continuously compile the purescript code:

* `npm run pulp --watch build`

Run the following to continuously compile typescript code and serve the application under [`http://localhost:1234`](http://localhost:1234):

* `npm run parcel serve src/index.html`
