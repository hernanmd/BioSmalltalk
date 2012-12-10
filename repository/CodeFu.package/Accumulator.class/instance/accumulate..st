accumulate
accumulate: aValue 

	size := size + 1.
	^value := (accumulateBlock value: value value: aValue).