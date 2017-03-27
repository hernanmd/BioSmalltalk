properties - filtering
geno: aFloat  
	" Exclude individuals with genotyping error rate greater than aFloat "

	self propertyAt: 'geno' ifAbsentPut: [ aFloat ]