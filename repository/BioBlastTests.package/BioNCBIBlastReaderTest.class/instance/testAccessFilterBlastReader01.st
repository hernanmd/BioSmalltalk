testing
testAccessFilterBlastReader01

	| ft |

	reader := BioNCBIBlastReader newFromXML: self resultBlastnDNA01.
	ft := reader filter definitionsBeginWith: #('Bos taurus').

	self assert: ( reader filter isKindOf: BioBlastFilter ).
	self assert: ( ft isKindOf: BioFilteredResult ).
	self assert: ( reader contents isKindOf: BioFilteredResult ).
	
	self deny: ft isEmpty.
	self assert: ft size = 87.
	