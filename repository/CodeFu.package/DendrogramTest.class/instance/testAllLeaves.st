test
testAllLeaves

	self assert: dendrogram elements size = 7.
	self assert: (dendrogram elements equalsTo: #(a b c d e f g)).