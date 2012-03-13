accessing
preferredProgram

	^ preferredProgram ifNil: [self graph isDirected ifTrue: ['dot'] ifFalse: ['neato']]
