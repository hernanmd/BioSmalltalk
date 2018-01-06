properties
vcf: fileName  
	" Set the input to a (possibly gzipped) VCF fileName "

	self propertyAt: 'vcf' ifAbsentPut: [ self buildPath: fileName ]