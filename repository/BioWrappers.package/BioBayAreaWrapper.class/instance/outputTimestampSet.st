options - input/output
outputTimestampSet
	" Append timestamp string to output prefix "

	self propertyAt: 'outputTimestamp' ifAbsentPut: [ 'T' ]
