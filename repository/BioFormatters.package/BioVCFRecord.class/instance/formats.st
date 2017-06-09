accessing
formats
	" Answer a <Collection> of format identifiers "
	
	^ formats
		ifNil: [ formats := OrderedCollection new: 13 ]