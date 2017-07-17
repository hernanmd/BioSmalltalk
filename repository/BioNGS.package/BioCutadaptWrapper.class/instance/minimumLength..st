properties
minimumLength: anInteger
	" Throw away processed reads shorter than anInteger bases "

	self propertyAt: 'm' ifAbsentPut: [ anInteger ]
