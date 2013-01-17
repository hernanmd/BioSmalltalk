constants
programName

	^OSPlatform isWin32
		ifTrue: [ 'svd.exe' ]
		ifFalse: [ 'svd' ]