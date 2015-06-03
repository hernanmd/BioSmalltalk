comparing
= aBioSampleCollection
	"Answer whether the receiver and anObject represent the same object."

	self == aBioSampleCollection
		ifTrue: [ ^ true ].
	self class = aBioSampleCollection class
		ifFalse: [ ^ false ].
	^ self samples = aBioSampleCollection samples