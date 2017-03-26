properties - filtering
fromKb: kbNumber
	" Set the lower limit variant ID to kbNumber "

	self propertyAt: 'from-kb' ifAbsentPut: [ kbNumber ]