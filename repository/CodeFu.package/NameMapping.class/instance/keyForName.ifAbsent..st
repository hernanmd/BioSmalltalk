accessing - name
keyForName: name ifAbsent: exceptionBlock

	^name isInteger 
		ifTrue: [ name ]
		ifFalse: [ names 
			findFirst: [ :each | comparisonBlock value: name value: each ] 
			ifAbsent: [ exceptionBlock value ]
		].