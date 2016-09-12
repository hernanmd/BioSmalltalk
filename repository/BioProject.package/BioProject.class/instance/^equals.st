comparing
= aBioProject
	" Answer <true> if receiver has the same name, information and usage as aBioProject "

	self == aBioProject
		ifTrue: [ ^ true ].
	self class = aBioProject class
		ifFalse: [ ^ false ].
	self info = aBioProject info
		ifFalse: [ ^ false ].
	self jobs = aBioProject jobs
		ifFalse: [ ^ false ].
	^ true