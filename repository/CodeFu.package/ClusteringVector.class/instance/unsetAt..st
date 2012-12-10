as yet unclassified
unsetAt: idx 

	super at: idx put: Float infinity.
	found = idx ifTrue: [ found := nil ]