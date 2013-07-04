accessing
writeAsEigenStrat
	" Write the receiver's input files in EigenStrat format "

	self fillSNPMatrix.
	self exportMatrix.
	self fillGenotypeMatrix.
	self exportMatrix.
