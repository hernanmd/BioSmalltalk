testing
testAsString

	| seqString |
	
	seqString := self sequence asString.
	self assert: (seqString  isKindOf: String).
	self assert: self sequence size equals: seqString size.
	self assert: (self sequence instVarNamed: #seq) equals: seqString.
