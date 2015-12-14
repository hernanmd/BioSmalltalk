properties
minCutoffFactor: aNumber 
	" Set The factor for increasing minium local alignment cutoff (default: 10) to be aNumber "

	self propertyAt: 'T' ifAbsentPut: [ aNumber ]