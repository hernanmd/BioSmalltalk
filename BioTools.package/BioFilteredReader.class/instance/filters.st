accessing filters
filters
	" Answer a filterer for selecting specific results from the receiver "
	
	^ filters
		ifNil: [ filters := OrderedCollection new ]
