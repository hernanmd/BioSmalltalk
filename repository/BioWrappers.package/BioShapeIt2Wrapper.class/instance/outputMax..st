properties
outputMax: outputMaxFilename 
	" Set output best haplotypes in HAPS/SAMPLE to be outputMaxFilename "

	self propertyAt: 'O' ifAbsentPut: [ outputMaxFilename ]