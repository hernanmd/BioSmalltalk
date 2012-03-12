testing
test02asString

	| seqString |
	
	seqString := self sequence asString.
	self assert: ( seqString  isKindOf: String ).
	self assert: self sequence size = seqString size.
	self assert: ( self sequence instVarNamed: #seq ) = seqString.
