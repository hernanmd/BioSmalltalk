comparing
= aBioBlastFilter
	"Answer whether the receiver and anObject represent the same object."

	self class = aBioBlastFilter class
		ifFalse: [ ^ false ].
	self size = aBioBlastFilter size
		ifFalse: [ ^ false ].
	self contents = aBioBlastFilter contents
		ifFalse: [ ^ false ].
	^ true