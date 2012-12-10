test
testIndex

	self assert: dendrogram index = 1.

	self assert: dendrogram left index = 1.
	self assert: dendrogram right index = 5.

	self assert: dendrogram left left index = 1.
	self assert: dendrogram left right index = 3.
	self assert: dendrogram right left index = 5.
	self assert: dendrogram right right index = 7.