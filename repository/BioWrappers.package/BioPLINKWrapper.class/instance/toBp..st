properties - filtering
toBp: bpNumber
	" Set the upper limit variant ID to mbNumber "

	self propertyAt: 'to-bp' ifAbsentPut: [ bpNumber ]