properties - input/output
outputPrefix: prefixName  
	" Set the analysis prefix name <String> for all output files "

	self propertyAt: 'outputPrefix' ifAbsentPut: [ prefixName ]
