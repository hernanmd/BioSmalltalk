accessing
removeMismatch: anObject
	" Remove anObject from the matched elements "

	^ self mismatches 
		detect: [ : d | d includes: anObject ]
		ifFound: [ : found | found remove: anObject ]
		ifNone: [ self inform: anObject asString , ' not found' ]