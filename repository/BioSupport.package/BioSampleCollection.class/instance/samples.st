accessing
samples
	" Answer a <Collection> of <BioSample> "

	^ samples
		ifNil: [ samples := OrderedCollection new ]