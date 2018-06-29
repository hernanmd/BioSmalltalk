accessing
atMatches
	" Answer a <Collection> with the default matched elements "
	
	^ self matches 
		at: #default
		ifAbsentPut: [ OrderedCollection new ]