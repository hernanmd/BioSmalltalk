properties
outputFilename: aString 
	" Set The scoring matrix file name to be aString "

	self propertyAt: 'O' ifAbsentPut: [ aString ]