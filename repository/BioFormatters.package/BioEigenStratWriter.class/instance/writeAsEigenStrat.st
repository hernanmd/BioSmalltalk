accessing
writeAsEigenStrat
	" Write the receiver's input file in the receiver's format "

	self parser: (self parserClass on: (BioObject openFullFileNamed: self pedFile)).
	self parser delimiter: Character tab.
	self fillSNPMatrix.
	self outputFile close