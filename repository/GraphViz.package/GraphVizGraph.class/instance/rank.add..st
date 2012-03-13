convenience
rank: aString add: anObject

	self subgraphDo:
		[self rank: #same.
		self add: aString.
		self add: anObject]