accessing - name
keyForName: name ifAbsent: exceptionBlock

	^name isInteger ifTrue: [ name ] ifFalse: [  
		self isRoot ifTrue: [ exceptionBlock value ]
			ifFalse: [ self keyOf: (parent keyForName: name ifAbsent: exceptionBlock) ]
	]