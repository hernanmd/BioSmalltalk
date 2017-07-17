properties
adapter3Prime: aSequenceString  
	" Set the adapter sequence to be aSequenceString "

	self propertyAt: 'a' ifAbsentPut: [ aSequenceString ]