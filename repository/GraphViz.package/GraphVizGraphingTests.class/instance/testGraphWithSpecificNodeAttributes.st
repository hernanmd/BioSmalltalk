as yet unclassified
testGraphWithSpecificNodeAttributes

	graph add: #A with: {#shape -> #box. #fontname -> #trebuc}.
	self should: [(graph dot lineNumber: 2) includesSubString:  'shape=box'].
	self should: [(graph dot lineNumber: 2) includesSubString:  'fontname=trebuc'] 