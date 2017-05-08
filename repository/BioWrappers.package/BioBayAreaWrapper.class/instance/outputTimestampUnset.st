options - input/output
outputTimestampUnset
	" Append timestamp string to output prefix "

	self propertyAt: 'outputTimestamp' ifAbsentPut: [ 'F' ]
