constants
programFolder

	^OSHandle currentOS = #win32
		ifTrue: [ SystemUtils getEnvironmentVariable: 'CommonProgramFiles' ]
		ifFalse: [ (SystemUtils getEnvironmentVariable: 'HOME'), '/Library' ]