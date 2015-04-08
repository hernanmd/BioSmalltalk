accessing
registry
	" Answer a <Collection> of <BioFileFormat> "
	
	^ Registry
		ifNil: [ Registry := OrderedCollection new ]