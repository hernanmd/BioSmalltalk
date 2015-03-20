testing
testFormatOSInterfaceAdapter

	| answer |
	
	answer := BioOSInterfaceEngine formatPlatformPath: 'C:\Archivos de Programa'.
	
	BioObject isRunningInWindows
		ifTrue: [ self assert: answer = '"C:\Archivos de Programa"' ].

