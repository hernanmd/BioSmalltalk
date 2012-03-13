as yet unclassified
testGraphWithTwoNodes

	graph add: #A.
	graph add: #B.
	
	self should: [(graph dot lineNumber: 2) = '	A;'].
	self should: [(graph dot lineNumber: 3) = '	B;'] 