properties
scoringMatrix: aFileReference 
	" Set The scoring matrix file name (default: dnaMatrix) to be aFileReference "

	self propertyAt: 'S' ifAbsentPut: [ aFileReference ]