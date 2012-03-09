testing
testAccessDNAAlignments01

	| alignment |

	reader := BioNCBIBlastReader newFromXML: self resultBlastnDNA01.	
	alignment := reader alignments.
	
	self assert: ( alignment isKindOf: BioAlignment ).
	self deny: alignment isEmpty.

	self assert: ( alignment names allSatisfy: [: each | ( BioAccessionParser on: each ) isAccession ] ).
	self assert: ( alignment sequences allSatisfy: #isBioSequence ).
	

