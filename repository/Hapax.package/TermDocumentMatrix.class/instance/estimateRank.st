SVD decomposing
estimateRank

	| rank |
	rank := ((matrix columnSize * matrix rowSize) ** 0.2) ceiling.
	^(((rank max: 3) min: matrix columnSize) min: matrix rowSize)