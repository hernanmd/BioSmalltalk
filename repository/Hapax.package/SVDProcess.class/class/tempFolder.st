constants
tempFolder

	^OSHandle currentOS = #win32
		ifTrue: [ SystemUtils getEnvironmentVariable: 'TMP' ]
		ifFalse: [ '/tmp' ]