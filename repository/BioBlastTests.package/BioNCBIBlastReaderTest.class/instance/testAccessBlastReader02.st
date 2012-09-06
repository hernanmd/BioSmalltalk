testing
testAccessBlastReader02
	" Accessing meta-information about the BLAST "

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	self assert: reader blastDbName = 'nr'.
	self assert: reader blastProgramVersion = 'BLASTN 2.2.23+'.
	self assert: reader blastQueryDef = 'No definition line'.
	self assert: reader blastQueryId = '47837'.
	self assert: reader blastQueryLength = '240'.

	
