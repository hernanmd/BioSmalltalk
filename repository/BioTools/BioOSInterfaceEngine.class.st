"
BioOSInterfaceEngine provides access to OS information like virtual machine system attributes, version information, platform names and subtype names. To access an engine use:

BioOSInterfaceEngine adapter.

Depending on your execution environment, you could have different implementation:

-Pharo currently uses ""OSPlatform""
-Squeak uses ""OSProcess""


"
Class {
	#name : #BioOSInterfaceEngine,
	#superclass : #BioAbstractAdapter,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioOSInterfaceEngine class >> execNameFor: programName [
	" Answer a String with the fully qualified name for programName, i.e. if programName is 'blast' then in Windows family the answer will be 'blast.exe' " 
	
	^ self adapterClass execNameFor: programName
]

{ #category : #accessing }
BioOSInterfaceEngine class >> formatPlatformPath: aPath [
	" Make necessary transformations on aPath for the current system, e.g. 
	'C:\Archivos de Programa' -> ""C:\Archivos de Programa"" "
	
	^ self adapterClass new formatPlatformPath: aPath

]

{ #category : #accessing }
BioOSInterfaceEngine class >> lineEndConvention [
	" Answer #cr, #lf or #crlf with the current's system line end convention " 
	
	^ self adapterClass new lineEndConvention
]

{ #category : #'instance creation' }
BioOSInterfaceEngine class >> new [
	" Answer a new instance of the receiver "

	^ self basicNew initializeWith: (self classFor: self providerClass)

]

{ #category : #accessing }
BioOSInterfaceEngine >> formatPlatformPath: aPath [
	" Private - Given aPath answer a <String> with the path properly formatted for the current platform "
	
	^ self isRunningInWindows
		ifTrue: [ String streamContents: [ : stream | stream nextPutAll: aPath between: $" and: $" ] ]
		ifFalse: [ aPath ]

]

{ #category : #testing }
BioOSInterfaceEngine >> isRunningInMac [
	" Answer <true> if the host system is running in Mac OS "
	
	^ self subclassResponsibility

]

{ #category : #testing }
BioOSInterfaceEngine >> isRunningInUnix [
	" Answer <true> if the host system is running in any Unix-like OS "
	
	^ self provider isUnix

]

{ #category : #testing }
BioOSInterfaceEngine >> isRunningInWindows [
	" Answer <true> if the host system is running in Microsoft Windows "
	
	^ self subclassResponsibility

]

{ #category : #accessing }
BioOSInterfaceEngine >> lineEndConvention [
	" Answer a <Symbol> #cr, #lf or #crlf with the current's system line end convention "

	self isRunningInUnix
		ifTrue: [ ^ #cr ].
	self isRunningInWindows
		ifTrue: [ ^ #crlf ].
	self isRunningInMac
		ifTrue: [ ^ #cr ].
]
