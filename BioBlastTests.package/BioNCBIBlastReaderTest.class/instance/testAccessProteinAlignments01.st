testing
testAccessProteinAlignments01

	| alignments |
	
	alignments := ( BioNCBIBlastReader newFromXML: self resultBlastp01 ) alignments.
	
	self assert: ( alignments isKindOf: BioAlignment ).
	self deny: alignments isEmpty.

	self assert: ( alignments names allSatisfy: [: each | ( BioAccessionParser on: each ) isAccession ] ).
	self assert: ( alignments sequences allSatisfy: #isProteinSequence ).
	

