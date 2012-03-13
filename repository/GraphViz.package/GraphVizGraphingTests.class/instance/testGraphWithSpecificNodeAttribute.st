as yet unclassified
testGraphWithSpecificNodeAttribute

	graph add: #A with: #shape -> #box.
	self should: [(graph dot lineNumber: 2) = '	A [shape=box];'] 