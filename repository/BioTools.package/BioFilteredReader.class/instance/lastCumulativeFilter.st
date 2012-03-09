accessing filters
lastCumulativeFilter
	" Answer the last filter from the receiver's filters which is cumulative "
	
	^ self filters reversed detect: [: f | f isCumulativeFilter ]