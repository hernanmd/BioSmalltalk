properties
minimumOverlapLength: aNumber
	" Set the minimum overlap length to reduce the number of falsely trimmed bases "

	self propertyAt: 'O' ifAbsentPut: [ aNumber ]
