"
Wrapper for ZINC HTTP Components. Zinc HTTP Components is an open-source Smalltalk framework to deal with the HTTP networking protocol. Pharo is our reference platform. Zn is reasonably mature and complete. It has been in development and in production use since 2010 and is a standard part for Pharo versions 1.3, 1.4, 2.0 and 3.0. 

See http://zn.stfx.eu/zn/index.html for details

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet

"
Class {
	#name : #BioZnHttpClient,
	#superclass : #BioWebClientEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioZnHttpClient class >> decode: aString [
	" See superimplementor's comment "

	| cUrl |
	
	cUrl := self urlClass fromString: aString.
	^ String streamContents: [ : str |
		str 
			nextPutAll: 'http://';
			nextPutAll: cUrl host;
			nextPut: $/;
			nextPutAll: cUrl path ]

]

{ #category : #testing }
BioZnHttpClient class >> isPreferredAdapter [
	" Private - See superimplementor's comment "

	^ self isRunningInPharo
]

{ #category : #accessing }
BioZnHttpClient class >> providerClass [
	" See superimplementor's comment "
	
	^ #ZnClient
]

{ #category : #accessing }
BioZnHttpClient class >> urlClass [
	" Answer a <Class> implementing an interpreted URL/URI "
	
	^ self classFor: #BioUrl
]

{ #category : #accessing }
BioZnHttpClient >> decode: aString [
	" See superimplementor's comment "

	^ aString urlDecoded

]

{ #category : #accessing }
BioZnHttpClient >> downloadUrl [
	" See superimplementor's comment "

	| cUrl |
	
	cUrl := self urlClass fromString: self url asString.
	^ cUrl asString


]

{ #category : #private }
BioZnHttpClient >> handleNonResumableConnection: anException [
	| msg |
	msg := 'We got a non-resumable exception while connecting to '
		, self url host asString
		, '. Re-try switching ZdcSocketStream to SocketStream?'.
	self bioLog: msg.
	(self confirm: msg)
		ifFalse: [ ^ self ].
	ZnNetworkingUtils default socketStreamClass: SocketStream.
	anException retry
]

{ #category : #accessing }
BioZnHttpClient >> handleProgressBar: bar notification: ex [ 

	| progress |

	progress := ex.
	progress isEmpty ifFalse: [ 
		bar current: progress percentage.
		progress total ifNotNil: [ : aTotalNumber |
			bar label: 'Downloading ' ] ].
	progress resume
]

{ #category : #accessing }
BioZnHttpClient >> handleWebClientException: ex progressBar: bar [

	(ex isKindOf: (Smalltalk at: #HTTPProgress))
		ifTrue: [ self handleProgressBar: bar notification: ex  ].
	(ex isKindOf: (Smalltalk at: #ZnLineTooLong))
		ifTrue: [ ex limit: 65535; retry ].
	(ex isKindOf: (Smalltalk at: #ZnEntityTooLarge))
		ifTrue:[ ex resume ]
		ifFalse: [ 
			ex isResumable 
				ifTrue: [ ex resume ]
				ifFalse: [ self handleNonResumableConnection: ex ] ].		


]

{ #category : #accessing }
BioZnHttpClient >> httpGet: urlString [
	"Get the response from the given url"
	" (self httpGet: 'http://www.squeak.org') content "
	
	UIManager default informUserDuring: [ : bar |
		bar label: 'Downloading...'.
		^ [ (self classFor: self providerClass) new get: urlString ]
		on: HTTPProgress, ZnEntityTooLarge, ConnectionClosed, ZnLineTooLong 
		do: [ : ex | self handleWebClientException: ex progressBar: bar ] ]

]
