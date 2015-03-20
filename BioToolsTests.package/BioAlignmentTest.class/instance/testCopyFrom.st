testing
testCopyFrom

	| set |
	
	align := self sampleAlignment01.
	
	set :=  align copyFrom: 2 to: 3.
	self assert: ( set isKindOf: Collection ).
	self assert: set size = 2.
	self assert: ( set allSatisfy: [: elem | elem isKindOf: BioSequence ] ).
	self assert: set first name = 'Beta'.
	self assert: set second name = 'Gamma'.
	
	align := self sampleAlignment02.
	set := align copyFrom: 1 to: 4.
	self assert: set size = 4.
	self assert: ( set allSatisfy: [: elem | elem isKindOf: BioSequence ] ).
	
	self should: [ align copyFrom: 5 to: 3 ] raise: BioException.
	self should: [ align copyFrom: 0 to: 2 ] raise: Error.
	self should: [ align copyFrom: (-1) to: 1 ] raise: Error.
	
