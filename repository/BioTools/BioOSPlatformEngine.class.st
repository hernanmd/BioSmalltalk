"
BioOSPlatformEngine was created for accessing OS information in Pharo.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
"
Class {
	#name : #BioOSPlatformEngine,
	#superclass : #BioOSInterfaceEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioOSPlatformEngine class >> execNameFor: programName [
	" Answer a String with the fully qualified name for programName, i.e. if programName is 'blast' then in Windows family the answer will be 'blast.exe' " 
	
	^ (self classFor: self providerClass) current execNameFor: programName


]

{ #category : #testing }
BioOSPlatformEngine class >> isPreferredAdapter [
	" Private - See superimplementor's comment "

	^ BioObject isRunningInPharo
]

{ #category : #accessing }
BioOSPlatformEngine class >> providerClass [
	" See superimplementor's comment "
	
	^ #OSPlatform
]

{ #category : #testing }
BioOSPlatformEngine >> isRunningInMac [
	" Answer <true> if the host system is running in Mac OS "
	
	^ Smalltalk os isMacOS or: [ Smalltalk os isMacOSX ]
]

{ #category : #testing }
BioOSPlatformEngine >> isRunningInUnix [
	" Answer <true> if the host system is running in any Unix-like OS "
	
	^ Smalltalk os isUnix
]

{ #category : #testing }
BioOSPlatformEngine >> isRunningInWindows [
	" Answer <true> if the host system is running in Microsoft Windows "
	
	^ Smalltalk os isWin32 or: [ Smalltalk os isWindows ]
]
