comparing
= aBioBlastFilter

	self class = aBioBlastFilter class
		ifFalse: [ ^ false ].
	self size = aBioBlastFilter size
		ifFalse: [ ^ false ].
	self contents = aBioBlastFilter contents
		ifFalse: [ ^ false ].
	^ true