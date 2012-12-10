scanning
next

	^term == Terms void 
		ifTrue: [ self privateNext ]
		ifFalse: [ 
			| result |
			result := term.
			term := Terms void.
			result ].