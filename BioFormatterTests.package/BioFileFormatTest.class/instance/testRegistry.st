testing
testRegistry

	self deny: BioFileFormat registry isNil.
	self deny: BioFileFormat registry isEmpty.
	self assert: ( BioFileFormat registry allSatisfy: [: f | f isKindOf: BioFileFormat ] ).
	