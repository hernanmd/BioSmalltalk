SVD decomposing
expectedRank
	^expectedRank ifNil: [ self estimateRank ]