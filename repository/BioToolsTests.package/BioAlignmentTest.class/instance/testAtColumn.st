testing
testAtColumn

	align := self sampleAlignment01.
	
	self assert: ( ( align atColumn: 2 ) isKindOf: String ).
	self assert: ( align atColumn: 4 ) = 'G-G'.
	self should: [ align atColumn: 20000 ] raise: BioErrorSpecificationObject.
	self should: [ align atColumn: 0 ] raise: BioErrorSpecificationObject.	
