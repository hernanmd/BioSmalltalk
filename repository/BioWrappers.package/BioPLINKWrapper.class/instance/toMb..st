properties - filtering
toMb: mbNumber
	" Set the upper limit variant ID to mbNumber "

	self propertyAt: 'to-mb' ifAbsentPut: [ mbNumber ]