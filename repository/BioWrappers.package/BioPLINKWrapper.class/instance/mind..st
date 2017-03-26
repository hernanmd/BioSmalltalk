properties - filtering
mind: aFloat  
	" Exclude individuals with genotyping error greater than aFloat "

	self propertyAt: 'mind' ifAbsentPut: [ aFloat ]