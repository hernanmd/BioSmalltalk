accessing
evaluate: subject context: aContext

	^ self condition isSymbol 
		ifTrue: [ aContext perform: self condition ]
		ifFalse: [ self condition cull: subject cull: aContext ]