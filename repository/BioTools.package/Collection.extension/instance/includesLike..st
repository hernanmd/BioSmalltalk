*BioTools
includesLike: aString
	"Answer whether anObject is like one of the receiver's elements."

	^ self anySatisfy: [ :each | (each asUppercase alike: aString asUppercase) > (aString size / 2) asFloat rounded ]