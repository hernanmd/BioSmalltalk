testing
testAccessBlastReader01
	" Accessing information about the BLAST "

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	reader setSAXParser.
	self deny: reader hitHspsNodes isEmpty.
	self 
		assert: ( reader hitHspsNodes isKindOf: BioBlastNode ) 
		description: 'Answer the nodes inside a root BioBlastNode'.
	self assert: reader hitHspsNodes hits size = 100.	

	self deny: reader hitResults isEmpty.
	self 
		assert: ( reader hitResults allSatisfy: [ : a | a isKindOf: BioBlastParentNode ] )
		description: 'Answer the nodes inside a root BioBlastNode'
