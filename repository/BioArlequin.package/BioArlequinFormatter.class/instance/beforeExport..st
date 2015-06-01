private
beforeExport: anObject
	" Answer a <String> if typed user name is valid, nil otherwise"

	| answer |

	answer := UIManager default request: 'Arlequin format requires a reference sequence to be specified to proper padding of the resulting alignment'.
	^ answer isEmptyOrNil 
		ifFalse: [ anObject querySequence: answer  ]
		ifTrue: [ self inform: 'Reference Sequence cannot be empty. Please try again' ]
