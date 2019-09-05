"
A web client implementation targeted for Squeak. See http://www.squeaksource.com/WebClient.html for details.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet

"
Class {
	#name : #BioWebClient,
	#superclass : #BioWebClientEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioWebClient class >> decode: aString [
	" See superimplementor's comment "

	^ (self urlClass decodeUrlEncodedForm: aString) keys anyOne
]

{ #category : #testing }
BioWebClient class >> isPreferredAdapter [
	" Private - See superimplementor's comment "

	^ self isRunningInSqueak

]

{ #category : #accessing }
BioWebClient class >> providerClass [
	" See superimplementor's comment "
	
	^ #WebClient

]

{ #category : #accessing }
BioWebClient class >> urlClass [
	" Answer a <Class> implementing an interpreted URL/URI "

	^ self classFor: #WebUtils
]

{ #category : #accessing }
BioWebClient >> downloadUrl [
	" See superimplementor's comment "

	^ (self urlClass decodeUrlEncodedForm: self url asString) keys anyOne
]

{ #category : #private }
BioWebClient >> responseType [

	^ self classFor: #WebResponse
]
