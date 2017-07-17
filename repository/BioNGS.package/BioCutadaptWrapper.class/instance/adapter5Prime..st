properties
adapter5Prime: aSequenceString  
	" Set the adapter sequence to be aSequenceString "

	self propertyAt: 'g' ifAbsentPut: [ aSequenceString ]