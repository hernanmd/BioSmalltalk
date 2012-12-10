accessing - name
keyForName: name ifAbsent: exceptionBlock

	^name isInteger ifTrue: [ name ]
		ifFalse: [ exceptionBlock value ]