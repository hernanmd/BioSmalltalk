accessing
edgeNamed: anAssociation

	| edge |
	edge := edges at: anAssociation ifAbsent: [nil].
	
	edge ifNil:
		[self subgraphs do:
			[:each |
			edge := each edgeNamed: anAssociation.
			edge ifNotNil: [^ edge]]].
	
	^ edge