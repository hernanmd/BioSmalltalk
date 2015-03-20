testing
testAsTriplet

	| seqFmt |
	
	seqFmt := BioSequenceFormatter new sequence: 'CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACA'.

	seqFmt delimiterTargetCharacter: Character space.
	self assert: seqFmt asTriplet = 'CCA CAC CAC ACC CAC ACA CCC ACA CAC CAC ACC ACA CAC CAC ACC ACA CCC ACA CAC ACA'.

	seqFmt delimiterTargetCharacter: Character tab.
	self assert: seqFmt asTriplet =  'CCA	CAC	CAC	ACC	CAC	ACA	CCC	ACA	CAC	CAC	ACC	ACA	CAC	CAC	ACC	ACA	CCC	ACA	CAC	ACA'.