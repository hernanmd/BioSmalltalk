private
extractIdentifiers: assoc

	| regions |

	^ ( regions := assoc value keys )
		ifNotNil: [ regions collect: [: breedString | self extractIdentifier: breedString ] ]
		ifNil: [ #('Unnamed') ].