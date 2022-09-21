"
Url class with methods to Entrez e-utils programming utilities web API.

This class should not be used directly, instead, see BioEntrezClient class.

"
Class {
	#name : #BioEntrezUrl,
	#superclass : #BioUrl,
	#category : #'BioEntrez-Core'
}

{ #category : #accessing }
BioEntrezUrl >> dbName [
	" Answer a String with the receiver's database name, if it was configured "

	"self valueForParameter: 'db'"
	^ self queryAt: 'db'
]

{ #category : #accessing }
BioEntrezUrl >> dbName: aString [
	" Append aString as the receiver's database name "

	self queryAt: 'db' put: aString

]

{ #category : #accessing }
BioEntrezUrl >> emailAddress: aString [
	" Append aString as the receiver's e-mail address "

	self queryAt: 'email' put: aString
]

{ #category : #accessing }
BioEntrezUrl >> entrezParameters [
	"Private - Answer a <Collection> of <String> representing valid Entrez parameters"
	
	^ ((BioEntrezCommand withAllSubclasses collect: #validParameters) 
				joinUsing: Array empty) asSet
]

{ #category : #accessing }
BioEntrezUrl >> parameters [
	"Answer a <Collection> with the receiver's parameter names"

	^ self hasQuery 
		ifTrue: [ self query keys ]
		ifFalse: [ Array new ]
]

{ #category : #accessing }
BioEntrezUrl >> queryKey: aKeyString [
	"Append aKeyString for setting the remote query key"

	aKeyString isEmpty
		ifFalse: [ self queryAt: 'query_key' put: aKeyString ]
		ifTrue: [ BioObject signalInvalidObject: 'Missing remote query key'  ]
]

{ #category : #accessing }
BioEntrezUrl >> setUseHistory [
	"Append a string to set the usehistory value to true"

	self queryAt: 'usehistory' put: 'y'
]

{ #category : #accessing }
BioEntrezUrl >> toolName: aString [
	" Append aString as the receiver's tool name "

	self queryAt: 'tool' put: aString
]

{ #category : #accessing }
BioEntrezUrl >> webEnv: aWebEnvString [
	" Append aWebEnvString for setting the remote web environment "

	aWebEnvString isEmpty
		ifFalse: [ self queryAt: 'WebEnv' put: aWebEnvString ]
		ifTrue: [ BioObject signalInvalidObject: 'Missing remote web environment id'  ]		
]
