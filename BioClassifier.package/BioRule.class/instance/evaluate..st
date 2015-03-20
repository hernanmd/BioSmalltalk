accessing
evaluate: subject

	^ self condition isSymbol 
		ifTrue: [ self context perform: self condition ]
		ifFalse: [ self condition cull: subject ]