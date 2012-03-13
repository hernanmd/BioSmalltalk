as yet unclassified
testSubGraph

	graph subgraph: #nested do:
		[graph add: #A].
	
	self should: [(graph dot lineNumber: 2) = '	subgraph nested {'].
	self should: [(graph dot lineNumber: 3) = '		A;'].
	self should: [(graph dot lineNumber: 4) = '	}'].
	self should: [(graph dot lineNumber: 5) = '}'].