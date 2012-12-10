accessing
at: anObject ifAbsent: exceptionBlock

	^forwards at: anObject ifAbsent: [ backwards at: anObject ifAbsent: exceptionBlock ]