testing
= aSample
	"Answer whether the receiver and anObject represent the same object."

	self == aSample
		ifTrue: [ ^ true ].
	self class = aSample class
		ifFalse: [ ^ false ].
	^ self sequence = aSample sequence and: [ self identifier = aSample identifier ]