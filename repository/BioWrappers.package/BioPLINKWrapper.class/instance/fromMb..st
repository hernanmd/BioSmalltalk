properties - filtering
fromMb: mbNumber
	" Set the lower limit variant ID to mbNumber "

	self propertyAt: 'from-mb' ifAbsentPut: [ mbNumber ]