accessing
allIdentifiers

	^ ( ( self allFinalClasses collect: #identifier ) 
			select: #isString)
			collect: [: id | ( id endsWith: '|' ) 
				ifTrue: [ id allButLast ] 
				ifFalse: [ id ] ]