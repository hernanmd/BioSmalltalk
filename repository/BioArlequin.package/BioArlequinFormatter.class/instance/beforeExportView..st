private
beforeExportView: aPCTView
	| labelText answer|
	
	labelText := 'Arlequin format requires a reference sequence to be specified to proper padding of the resulting alignment'.
	^ self isPhyloclassTalk
		ifTrue: [ answer := (Smalltalk at: #PCTSequenceInputComponent) new 
				labelText: labelText; 
				openDialogWithSpec;
				centered.
			self halt.
			aPCTView querySequence: answer.
			true  ]
		ifFalse: [ (answer := UIManager default request: labelText) isEmptyOrNil 
			ifFalse: [ 
				aPCTView querySequence: answer.
				true  ]
			ifTrue: [ self inform: 'Reference Sequence cannot be empty. Please try again'.
				false ] ]