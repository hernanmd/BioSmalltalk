as yet unclassified
testGraphWithDoubleQuotedId

	graph add: 'HI THERE'.
	self should: [(graph dot lineNumber: 2) = '	"HI THERE";'] 