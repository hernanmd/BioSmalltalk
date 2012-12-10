accessing - name
keyForName: name

	^self keyForName: name ifAbsent: [ KeyNotFound raise ]