testing
testFileExtensionsFor

	| fastaExt |
	
	fastaExt := BioFileFormat fileExtensionsFor: 'FASTA'.
	self deny: fastaExt isNil.
	self deny: fastaExt isString.
	self assert: ( fastaExt isKindOf: SequenceableCollection ).	
	self assert: fastaExt = #('fast' 'seq' 'fa' 'fsa' 'nt' 'aa').
	self should: [ BioFileFormat fileExtensionsFor: '' ] raise: BioNotFoundObject.