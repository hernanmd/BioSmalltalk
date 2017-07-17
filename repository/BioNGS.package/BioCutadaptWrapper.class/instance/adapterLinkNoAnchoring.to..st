properties
adapterLinkNoAnchoring: adapterSequenceString1 to: adapterSequenceString2
	" Set the 5' or 3' adapter (both possible) sequence to be aSequenceString "

	self propertyAt: 'g' ifAbsentPut: [ adapterSequenceString1 , '...' , adapterSequenceString2 ]