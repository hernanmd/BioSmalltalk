accumulate
accumulate: aValue withIndex: anIndex

	| oldValue changed |
	size := size + 1.
	oldValue := value.
	value := accumulateBlock value: value value: aValue.
	changed  := oldValue ~= value.
	changed ifTrue: [ index := anIndex ].
	^changed not