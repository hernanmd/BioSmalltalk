testing
testCreation

	| blastResult |
	
	blastResult := BioNCBIBlastReader new.
	self assert: (blastResult isKindOf: BioNCBIBlastReader).
	self assert: (blastResult blastProperties isKindOf: Collection).
	self deny: blastResult blastProperties isEmpty.
	