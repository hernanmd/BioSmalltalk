testing
test02LatestLocalClientAccess

	| blastInterface |
	
	blastInterface := BioBlast.
	
	self assert: blastInterface ncbi local latest class = BioNCBILocalBlastPlus2224.
	self assert: blastInterface ncbi local latest blastxPath isString.
	self assert: blastInterface ncbi local latest blastnPath isString.
	self assert: blastInterface ncbi local latest blastpPath isString.
	self assert: blastInterface ncbi local latest tblastnPath isString.
	self assert: blastInterface ncbi local latest tblastxPath isString.


	
