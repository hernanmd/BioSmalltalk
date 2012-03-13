as yet unclassified
testObjectsHaveAttributes

	graph add: #A with: #label -> 'A label'.
		
	self should: [graph nodes first attributes size = 1].
	self should: [(graph nodes first attributes at: #label) = 'A label'].
	
	graph add: #B with: {#foo -> #bar. #doo -> #boo}.
	self should: [graph nodes second attributes size = 2]