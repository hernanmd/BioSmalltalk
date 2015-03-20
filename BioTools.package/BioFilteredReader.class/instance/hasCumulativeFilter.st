accessing filters
hasCumulativeFilter
	" Answer true if any of the receiver's filters is cumulative. This implies that subsequent filters
	will be applied to the found cumulative filter "
	
	^ self filters anySatisfy:[ : f | f isCumulativeFilter ]