testing
testHasContents

	reader := BioNCBIBlastReader newFromXML: self resultBlastnDNA01.	
	self assert: reader hasContents.
	

