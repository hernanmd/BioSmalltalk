properties - filtering
fromBp: bpNumber
	" Set the lower limit variant ID to bpNumber "

	self propertyAt: 'from-bp' ifAbsentPut: [ bpNumber ]