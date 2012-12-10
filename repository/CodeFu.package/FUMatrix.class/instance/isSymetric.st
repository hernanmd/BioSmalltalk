testing
isSymetric
	"Answer if the reciever is a symetric matrix."

	self isSquare ifFalse: [ ^false ].
	1 to: self columnSize do: [ :column |
		1 to: column do: [ :row |
			(self at: column and: row) = (self at: row and: column) ifFalse: [ ^false ] 
		]
	].
	^true