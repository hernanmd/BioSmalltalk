properties - input/output
outputFilePath: directoryName  
	" Set the directory name <String> for output files "

	self propertyAt: 'outputFilePath' ifAbsentPut: [ directoryName ]