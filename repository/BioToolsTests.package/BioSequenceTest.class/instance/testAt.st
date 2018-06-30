testing
testAt

	self assert: (self sequence at: 2) equals: $A.
	self assert: (self sequence at: 3) equals: $G.
	self should: [ self sequence at: 600 ] raise: BioErrorSpecificationObject.


