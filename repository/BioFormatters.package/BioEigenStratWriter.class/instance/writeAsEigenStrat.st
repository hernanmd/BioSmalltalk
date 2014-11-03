accessing
writeAsEigenStrat
	" Write the receiver's input files in EigenStrat format "

	self delimiter: Character tab.
	self fillSNPMatrix.
	self exportMatrix.
	
	self outputFile: nil.	
	self delimiter: nil.
	self outputFilename: (self outputFilename copyUpTo: $.) , '.geno'.
	self exportMatrix: self fillGenotypeMatrix.
