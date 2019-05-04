_parcel: src/index.html src/index.ts
	parcel build src/index.html

_purescript: src/Main.purs
	pulp test
	pulp build

build: _purescript _parcel

publish: dist
	surge dist fun-with-frontend.surge.sh