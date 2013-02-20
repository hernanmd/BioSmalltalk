testing
testBlastProperties

	| blastResult |
	
	blastResult := BioNCBIBlastReader new.
	self assert: (blastResult blastProperties allSatisfy: [: p | p isKindOf: MQBProperty]).
	
	self deny: (blastResult blastProperties collect: #displayName) isEmpty.
	self deny: (blastResult blastProperties collect: #explanation) isEmpty.
	self deny: (blastResult blastProperties collect: #name) isEmpty.
	self deny: (blastResult blastProperties collect: #type) isEmpty.

	