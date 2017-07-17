properties
shortenReads: anInteger
	" Shorten each read down to a certain length "

	self propertyAt: 'l' ifAbsentPut: [ anInteger ]