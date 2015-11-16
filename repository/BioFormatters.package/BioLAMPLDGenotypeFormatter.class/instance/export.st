accessing
export
	" Export default features "

	self writeSampleRows.
	self outputFile close.
	self bioLog: 'Exported CSV genotype contents in file ' , self outputFilename.