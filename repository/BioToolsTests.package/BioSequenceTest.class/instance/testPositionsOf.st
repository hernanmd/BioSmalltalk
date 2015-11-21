testing
testPositionsOf

	| expected |
	
	self sequence: self sampleProtString01 alphabet: BioIUPACUnambiguousRNA.
	expected := OrderedCollection withAll: #(11 14 23 27 67 87).
	
	self assert: ( self sequence positionsOf: $K ) = expected.
	self assert: ( self sequence positionsOf: $Z ) isEmpty.
	self assert: ( self sequence positionsOf: 'K' ) = expected.
	self assert: ( self sequence positionsOf: 'Z' ) isEmpty.

	self should: [ self sequence positionsOf: nil ] raise: Error.
	self should: [ self sequence positionsOf: 3 ] raise: Error.
	self should: [ self sequence positionsOf: String empty ] raise: BioException.


