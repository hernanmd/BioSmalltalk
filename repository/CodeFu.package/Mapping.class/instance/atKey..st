accessing - key
atKey: key

	^self atKey: key ifAbsent: [ KeyNotFound raise ]