# FWF — Fun With Front-End

Exploring different languages by mixing them together. In one project. For fun. Because we can.

Languages used in the project:

* PureScript
* TypeScript

## Installation instructions

```
yarn global add purescript psc-package bower pulp parcel
yarn
bower install
psc-package install
```

## Running the project

Run the following to continuously compile the purescript code:
* `pulp --watch build`

Run the following to continuously compile typescript code and serve the application under `http://localhost:1234`:
* `parcel serve src/index.html`