accessing
handleWebClientException: ex progressBar: bar

	(ex isKindOf: (Smalltalk at: #HTTPProgress))
		ifTrue: [ self handleProgressBar: bar notification: ex  ].
	(ex isKindOf: (Smalltalk at: #ZnLineTooLong))
		ifTrue: [ ex limit: 65535; retry ].
	(ex isKindOf: (Smalltalk at: #ZnEntityTooLarge))
		ifTrue:[ ex resume ]
		ifFalse: [ 
			ex isResumable 
				ifTrue: [ ex resume ]
				ifFalse: [ self handleNonResumableConnection: ex ] ].		

