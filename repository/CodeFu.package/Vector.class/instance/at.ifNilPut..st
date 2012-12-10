accessing
at: index ifNilPut: aBlock
	"Answer the value at anIndex.  If the value is nil, set it to be
	the result of evaluating valueBlock, and answer that value."

	^(self at: index) ifNil: [ self at: index put: aBlock value ]