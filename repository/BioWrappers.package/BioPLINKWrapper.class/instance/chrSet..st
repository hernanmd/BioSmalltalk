properties - filtering
chrSet: chrNumber  
	" Set the output to filter chromosome aNumberOrCharacter.
	 The first parameter specifies the number of diploid autosome pairs if positive, or haploid chromosomes if negative"

	self assert: [ chrNumber <= 95 ] description: 'Maximum chromosome number is currently limited to 95'.
	self propertyAt: 'chr-set' ifAbsentPut: [ chrNumber ]