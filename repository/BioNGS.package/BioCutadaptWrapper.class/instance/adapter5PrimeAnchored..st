properties
adapter5PrimeAnchored: aSequenceString  
	" Set the adapter sequence to be aSequenceString "

	self propertyAt: 'g' ifAbsentPut: [ '^' , aSequenceString ]