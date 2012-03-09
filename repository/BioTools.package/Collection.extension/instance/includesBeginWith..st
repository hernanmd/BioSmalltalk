*BioTools
includesBeginWith: aString
	"Answer whether anObject is like one of the receiver's elements."

	^ self anySatisfy: [:each | 
			each isString ifTrue: [
				each asUppercase beginsWith: aString asUppercase ]
			ifFalse: [
				each anySatisfy: [ : ss | ( ss asUppercase alike: aString asUppercase ) > ( aString size / 2 ) asFloat rounded ] ] ]