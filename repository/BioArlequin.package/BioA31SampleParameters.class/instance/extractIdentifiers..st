private
extractIdentifiers: assoc
	| regions |
	^ (regions := assoc value keys)
		ifNotNil: [ :arg | regions collect: [ :breedString | self extractIdentifier: breedString ] ]
		ifNil: [ #('Unnamed') ]