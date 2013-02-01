testing
testBlastPropertyAt

	| blastResult |
	blastResult := BioNCBIBlastResult new.
	self assert: ((blastResult blastPropertyAt: 'ALIGNMENT LENGTH') isKindOf: BioProperty).

	