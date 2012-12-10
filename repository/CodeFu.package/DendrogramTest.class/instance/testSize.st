test
testSize

	self assert: dendrogram size = 7.

	self assert: dendrogram left size = 4.
	self assert: dendrogram right size = 3.

	self assert: dendrogram left left size = 2.
	self assert: dendrogram left right size = 2.
	self assert: dendrogram right left size = 2.
	self assert: dendrogram right right size = 1.