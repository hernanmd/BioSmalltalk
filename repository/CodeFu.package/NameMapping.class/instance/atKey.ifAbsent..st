accessing
atKey: key ifAbsent: exceptionBlock

	^(key between: 1 and: self size)
		ifTrue: [ key ]
		ifFalse: [ exceptionBlock value ]