accessing - name
nameOf: index ifAbsent: exceptionBlock

	^self nameForKey: (self keyOf: index ifAbsent: exceptionBlock)