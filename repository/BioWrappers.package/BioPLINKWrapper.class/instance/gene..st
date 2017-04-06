properties - filtering
gene: aCollection  
	" If variants have been assigned to sets (via --set/--make-set), takes aCollection of set names and removes all variants not in one of the named sets "

	self propertyAt: 'gene' ifAbsentPut: [ aCollection joinUsing: ' ' ]