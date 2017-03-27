properties - filtering
maf: aFloat  
	" Exclude individuals with minor allele frequency greater than aFloat "

	self propertyAt: 'maf' ifAbsentPut: [ aFloat ]