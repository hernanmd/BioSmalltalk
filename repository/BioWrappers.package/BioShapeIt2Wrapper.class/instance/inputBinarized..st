properties
inputBinarized: inputFilename  
	" Set bed, bim, fam input all at once to be fileName "

	self propertyAt: 'B' ifAbsentPut: [ inputFilename  ]