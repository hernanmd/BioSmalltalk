initialize-release
initializeWith: samplesDictionary

	frequencies := OrderedCollection new.
	sequences := OrderedCollection new.
	identifiers := OrderedCollection new.
	prvIdentifiers := Dictionary new.
	self samplesPrefix: '_' , ((SmallInteger maxVal atRandom greaseString) first: 3).
	self buildSamples: samplesDictionary.
