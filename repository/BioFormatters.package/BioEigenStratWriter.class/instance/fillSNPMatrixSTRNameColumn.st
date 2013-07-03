private
fillSNPMatrixSTRNameColumn
	" Private - Configure the parser for allele frequencies as produced from MSTools.
	Set the SNP matrix values accordingly "

	rowIndex := 1.
	self setParserForAlleleFqs.
	self preallocateMatrix.
	self parser rowsDo: [ : row |
		self fillSNPMatrixSTRName: row ]

