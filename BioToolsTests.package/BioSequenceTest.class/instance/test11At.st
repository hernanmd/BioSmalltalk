testing
test11At

	self assert: ( self sequence at: 2 ) = $A.
	self assert: ( self sequence at: 3 ) = $G.
	self should: [ self sequence at: 600 ] raise: BioErrorSpecificationObject.


