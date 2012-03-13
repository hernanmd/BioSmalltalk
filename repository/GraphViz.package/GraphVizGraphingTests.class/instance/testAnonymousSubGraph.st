as yet unclassified
testAnonymousSubGraph

	graph subgraphDo:
		[graph add: #A].
	
	self should: [(graph dot lineNumber: 2) = '	{'].
	self should: [(graph dot lineNumber: 3) = '		A;'].
	self should: [(graph dot lineNumber: 4) = '	}'].
	self should: [(graph dot lineNumber: 5) = '}'].