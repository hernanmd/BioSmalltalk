testing
testCreation

	| blastResult |
	
	blastResult := BioNCBIBlastResult new.
	self assert: (blastResult isKindOf: BioNCBIBlastResult).
	self assert: (blastResult blastProperties isKindOf: Collection).
	self deny: blastResult blastProperties isEmpty.
	