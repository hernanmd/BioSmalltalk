Extension { #name : #Integer }

{ #category : #'*codefu' }
Integer >> maskClear: mask [ 
	"Treat the argument as a bit mask.  Answer a copy of the receiver with the
	corresponding bits turned off."

	^self bitAnd: (mask bitInvert)
]

{ #category : #'*codefu' }
Integer >> maskSet: mask [ 
	"Treat the argument as a bit mask.  Answer a copy of the receiver with the
	corresponding bits turned on."

	^self bitOr: mask
]
