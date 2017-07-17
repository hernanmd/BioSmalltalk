properties
adapter: aSequenceString  
	" Set the 5' or 3' adapter (both possible) sequence to be aSequenceString "

	self propertyAt: 'b' ifAbsentPut: [ aSequenceString ]