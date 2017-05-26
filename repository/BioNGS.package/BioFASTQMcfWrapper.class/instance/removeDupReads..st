properties
removeDupReads: aNumber
	" Remove duplicate reads : Read_1 has an identical N bases (0) "

	self propertyAt: 'D' ifAbsentPut: [ aNumber ]