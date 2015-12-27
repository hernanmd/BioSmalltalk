testing
testHasContents

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.	
	self assert: reader hasContents.


