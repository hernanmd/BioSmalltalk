testing
testBlastPropertyAt

	| blastResult |
	blastResult := BioNCBIBlastReader new.
	self assert: ((blastResult blastPropertyAt: 'ALIGNMENT LENGTH') isKindOf: MQBProperty).

	