properties
maximumLength: anInteger
	" Throw away processed reads longer than anInteger bases "

	self propertyAt: 'M' ifAbsentPut: [ anInteger ]
