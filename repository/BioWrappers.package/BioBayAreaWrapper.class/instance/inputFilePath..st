properties - input/output
inputFilePath: directoryName  
	" Set the directory name <String> for input files "

	self propertyAt: 'inputFilePath' ifAbsentPut: [ directoryName ]