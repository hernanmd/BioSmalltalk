accessing-sequence
letterAnnotationsAt: aKey put: aCollection
	" At aKey add aCollection to the receiver's per-letter annotation for the sequence. aCollection must match the length of the receiver's sequence length "
	
	aCollection size = self sequence size
		ifTrue: [ ^ self letterAnnotations at: aKey put: aCollection ]
		ifFalse: [ self signalInvalidObject: 'Unmatched letter annotations length and sequence length' translated ].