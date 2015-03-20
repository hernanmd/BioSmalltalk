accessing
removeMatch: anObject
	" Remove anObject from the matched elements "
	
	^ self matches 
		detect: [ : d | d includes: anObject ]
		ifFound: [ : found | found remove: anObject ]