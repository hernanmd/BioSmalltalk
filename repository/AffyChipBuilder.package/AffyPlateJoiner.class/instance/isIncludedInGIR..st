testing
isIncludedInGIR: aStringID 

	^ ((self readSamplesC: self rootDirectory / 'Gir_IndivIDs.txt') collect: #first) includes: aStringID first.