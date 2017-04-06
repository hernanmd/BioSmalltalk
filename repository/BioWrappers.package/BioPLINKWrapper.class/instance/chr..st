properties - filtering
chr: aCollectionOrInterval  
	" Set the output to filter chromosome aCollectionOrInterval "

	self propertyAt: 'chr' ifAbsentPut: [ aCollectionOrInterval asPLINKParameter ]