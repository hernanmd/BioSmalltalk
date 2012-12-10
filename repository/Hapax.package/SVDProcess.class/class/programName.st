constants
programName

	^OSHandle currentOS = #win32
		ifTrue: [ 'svd.exe' ]
		ifFalse: [ 'svd' ]