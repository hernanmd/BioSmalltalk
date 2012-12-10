adding
add: index
	"Maps an index to the next free key.
	If the index is already mapped, throws an error.
	@post-condition: 
		anIndex <= self indexSize.
		self keyAt: anIndex = self size.
		self indexAt: self size = anIndex.
	"

	index > self lastIndex 
		ifTrue: [ forth changeSizeTo: index ]
		ifFalse: [ (self includesIndex: index) ifTrue: [ Error raiseRequest ] ].
	back add: index.
	forth at: index put: back size.
	^index