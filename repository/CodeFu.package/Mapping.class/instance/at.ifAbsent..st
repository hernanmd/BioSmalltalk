accessing
at: name ifAbsent: exceptionBlock

	^self atKey: (self keyForName: name ifAbsent: exceptionBlock) ifAbsent: exceptionBlock