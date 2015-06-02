private
beforeExport: aPCTView
	" See superimplementor's comment "

	aPCTView hasQuerySequence ifFalse: [ 
		| answer |		
		answer := UIManager default request: 'Arlequin format requires a reference sequence to be specified to proper padding of the resulting alignment'.
		^ answer isEmptyOrNil 
			ifFalse: [ 
				aPCTView querySequence: answer.
				true  ]
			ifTrue: [ self inform: 'Reference Sequence cannot be empty. Please try again'.
				false ] ].
	^ true
