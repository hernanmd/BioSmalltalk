properties - filtering
removeClusters: fileName  
	" Removes all samples in clusters named in a file "

	self propertyAt: 'remove-cluster' ifAbsentPut: [ self buildPath: fileName ]