comparing
= anObject
	"Answer whether the receiver and anObject represent the same object."
	" Two search results are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the size and name.
	 (c) for each result, they have the same result object "

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	self size = anObject size
		ifFalse: [ ^ false ].
	self result = anObject result.
	^ true