accessing
allIdentifiers

	^ ( ( self allFinalClasses collect: #identifier ) 
			select: #isString)
			collect: [: id | ( id endsWithSubCollection: '|' ) 
				ifTrue: [ id allButLast ] 
				ifFalse: [ id ] ]