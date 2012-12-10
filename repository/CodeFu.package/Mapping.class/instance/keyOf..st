accessing - key
keyOf: index

	^self keyOf: index ifAbsent: [ ValueNotFound raise ]