accessing
classFor: aLiteralOrClass

	^ aLiteralOrClass isLiteral
		ifTrue: [ Smalltalk at: aLiteralOrClass asSymbol ifAbsent: [ nil ] ]
		ifFalse: [ ^ aLiteralOrClass ].