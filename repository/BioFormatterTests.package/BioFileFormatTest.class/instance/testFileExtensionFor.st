testing
testFileExtensionFor

	| fastaExt |
	
	fastaExt := BioFileFormat fileExtensionFor: 'FASTA'.
	self deny: fastaExt isNil.
	self assert: fastaExt isString.
	self assert: fastaExt = 'fast'.
	self should: [ BioFileFormat fileExtensionFor: String empty ] raise: BioNotFoundObject.