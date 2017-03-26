properties - filtering
chr: aNumberOrCharacter  
	" Set the output to filter chromosome aNumberOrCharacter "

	self propertyAt: 'chr' ifAbsentPut: [ aNumberOrCharacter ]