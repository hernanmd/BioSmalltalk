properties
openGapPenality: aNumber 
	" Set The opening gap penalty (default: -500) to be aNumber "

	self propertyAt: 'G' ifAbsentPut: [ aNumber ]