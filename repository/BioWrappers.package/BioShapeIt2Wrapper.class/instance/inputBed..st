properties
inputBed: inputBedFilename 
	" Set bed, bim, fam input to be fileName "

	self propertyAt: 'B' ifAbsentPut: [ inputBedFilename ]