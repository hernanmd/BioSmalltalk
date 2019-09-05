"
BioSerializationEngine was created for accessing OS information in Squeak 4.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
"
Class {
	#name : #BioOSProcessEngine,
	#superclass : #BioOSInterfaceEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioOSProcessEngine class >> execNameFor: programName [
	" Answer a String with the fully qualified name for programName, i.e. if programName is 'blast' then in Windows family the answer will be 'blast.exe' " 
	
	^ (self classFor: self providerClass) accessor execNameFor: programName

]

{ #category : #testing }
BioOSProcessEngine class >> isPreferredAdapter [
	" Private - See superimplementor's comment "

	^ BioObject isRunningInSqueak
]

{ #category : #accessing }
BioOSProcessEngine class >> providerClass [
	" See superimplementor's comment "
	
	^ #OSProcess
]

{ #category : #testing }
BioOSProcessEngine >> isRunningInMac [
	" Answer <true> if the host system is running in Mac OS "
	
	^ self provider isNonUnixMac or: [ self provider isUnixMac ]
]

{ #category : #testing }
BioOSProcessEngine >> isRunningInWindows [
	" Answer <true> if the host system is running in Microsoft Windows "
	
	^ self provider isWindows
]
