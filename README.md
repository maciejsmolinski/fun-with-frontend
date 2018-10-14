# FWF — Fun With Front-End

Exploring different languages by mixing them together. In one project. For fun. Because we can.

Languages used in the project:

* PureScript
* TypeScript
* ReasonML

## Installation instructions

```
yarn global add purescript bower pulp parcel bs-platform
yarn
bower install
```

## Running the project

Run the following to continuously compile the purescript code:
* `pulp --watch build`

Run the following to continuously compile typescript code and serve the application under `http://localhost:1234`:
* `parcel serve src/index.html`

## Running the project with Docker

In order to run a docker container serving the application under `http://localhost:4321` run:
* `docker-compose up`