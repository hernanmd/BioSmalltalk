properties
removeBases: aNumber
	" Remove aNumber of bases from the beginning or end of each read. Applied before any adapter trimming "

	self propertyAt: 'u' ifAbsentPut: [ aNumber ]