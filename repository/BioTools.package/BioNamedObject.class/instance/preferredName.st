accessing
preferredName
	" Answer a String with the receiver's preferred name "

	^ names
		ifNil: [ self nullName ]
		ifNotNil: [ :arg | 
			names isString
				ifTrue: [ names ]
				ifFalse: [ names first ] ]