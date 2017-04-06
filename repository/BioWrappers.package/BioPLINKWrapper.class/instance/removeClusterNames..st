properties - filtering
removeClusterNames: aCollection  
	" Removes all samples in clusters named on aCollection "

	self propertyAt: 'remove-cluster-names' ifAbsentPut: [ aCollection joinUsing: ' ' ]