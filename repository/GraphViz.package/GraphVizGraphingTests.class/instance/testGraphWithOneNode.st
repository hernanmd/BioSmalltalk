as yet unclassified
testGraphWithOneNode

	graph add: #A.
	self should: [(graph dot lineNumber: 2) = '	A;'] 