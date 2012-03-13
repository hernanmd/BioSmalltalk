as yet unclassified
testGraphWithSimpleAttribute

	graph at: #label put: #title.
	self should: [(graph dot lineNumber: 2) = '	label=title;']