accessing
at: index put: boolean

	^boolean 
		ifTrue: [ bits := bits maskSet: 1 << (index - 1) ]
		ifFalse: [ bits := bits maskClear: 1 << (index - 1) ]