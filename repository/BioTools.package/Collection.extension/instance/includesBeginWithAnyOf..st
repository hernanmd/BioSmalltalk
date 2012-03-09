*BioTools
includesBeginWithAnyOf: aCollection
	"Answer whether any element of aCollection is one of the receiver's elements."
	
	aCollection do: [:elem | (self includesBeginWith: elem) ifTrue: [^ true]].
	^ false