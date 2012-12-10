accessing
atAllPut: collection

	(collection isKindOf: Collection)
		ifTrue: [ self with: collection affect: [ :a :b | b ] ]
		ifFalse: [ super atAllPut: collection ].