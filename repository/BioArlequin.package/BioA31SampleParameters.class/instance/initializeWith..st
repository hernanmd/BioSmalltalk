initialize-release
initializeWith: samplesDictionary

	frequencies := OrderedCollection new.
	sequences := OrderedCollection new.
	identifiers := OrderedCollection new.
	prvIdentifiers := Dictionary new.
	self samplesPrefix: ( ( SmallInteger maxVal atRandom asString ) first: 3 ).
	self buildSamples: samplesDictionary.
