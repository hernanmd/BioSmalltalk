Class {
	#name : #BioHTTPClient,
	#superclass : #BioWebClientEngine,
	#category : 'BioTools-Adapters'
}

{ #category : #accessing }
BioHTTPClient class >> providerClass [
	" See superimplementor's comment "
	
	^ #HTTPClient
]

{ #category : #accessing }
BioHTTPClient >> decode: aString [
	" See superimplementor's comment "

	self signalInvalidObject: 'Operation not supported' translated.

]

{ #category : #accessing }
BioHTTPClient >> downloadUrl [
	" See superimplementor's comment "

	^ self url asString unescapePercents
]
