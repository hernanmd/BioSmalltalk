accessing
referenceAlleles
	^ referenceAlleles
		ifNil: [ referenceAlleles := self initializeReferenceAlleles ]