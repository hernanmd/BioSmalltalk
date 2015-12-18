properties
referenceAlleles: fileName 
	" Set the reference alleles to fileName "

	self propertyAt: 'reference-allele' ifAbsentPut: [ fileName ]