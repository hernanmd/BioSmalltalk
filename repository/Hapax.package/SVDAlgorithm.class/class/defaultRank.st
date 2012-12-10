heuristic
defaultRank

	| rank |
	rank := ((self documentSize * self termSize) ** 0.2) ceiling.
	^(((rank max: 3) min: self documentSize) min: self termSize)