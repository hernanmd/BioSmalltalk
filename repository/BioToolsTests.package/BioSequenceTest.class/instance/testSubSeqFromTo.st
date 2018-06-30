testing
testSubSeqFromTo

	| subSeqString |
	
	subSeqString := self sequence subSeqFrom: 1 to: 5.
	self assert: (subSeqString isKindOf: String).
	self assert: subSeqString equals: 'cagtc' asUppercase.
	
	subSeqString := self sequence subSeqFrom: 1 to: 1.
	self assert: (subSeqString isKindOf: String).
	self assert: subSeqString equals: 'C'.
	
	self should: [ self sequence subSeqFrom: 5 to: 1 ] raise: Error.
	self should: [ self sequence subSeqFrom: 0 to: 1 ] raise: Error.