accessing - name
nameForKey: key

	^self isRoot ifTrue: [ KeyNotFound raise ]
		ifFalse: [ parent nameForKey: (self atKey: key) ]