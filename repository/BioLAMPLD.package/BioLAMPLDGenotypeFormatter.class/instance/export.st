accessing
export
	" Export default features "

	self writeSampleRows.
	self outputFileStream close.
	self bioLog: 'Exported genotype contents in file ' , self outputFilename.