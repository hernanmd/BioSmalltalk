"
BioWebClientEngine is the superclass for HTTP clients, which lets to make request and get both the response content and the response headers
"
Class {
	#name : #BioWebClientEngine,
	#superclass : #BioAbstractAdapter,
	#instVars : [
		'url'
	],
	#classVars : [
		'AdapterClass'
	],
	#category : 'BioTools-Adapters'
}

{ #category : #accessing }
BioWebClientEngine class >> adapterClass: aClass [
	" Set the receiver's subclass acting as adapter to be aClass "
	
	^ AdapterClass := aClass
]

{ #category : #accessing }
BioWebClientEngine class >> decode: aString [
	" Answer a String. Decodes the fields embedded in aString url ?var1=val1&var2=val2 "
	
	^ self adapterClass new decode: aString
]

{ #category : #'instance creation' }
BioWebClientEngine class >> for: anUrl [

	^ self adapterClass new 
		url: anUrl;
		initializeWith: (self classFor: self adapterClass providerClass) new;
		yourself

]

{ #category : #accessing }
BioWebClientEngine class >> urlFromString: aString [
	" Answer an URL object with aString as resource locator "
	
	^ self adapterClass new urlFromString: aString
]

{ #category : #accessing }
BioWebClientEngine >> decode: aString [
	" Answer a String. Decodes the fields embedded in aString url ?var1=val1&var2=val2 "
	
	^ self provider decode: aString
]

{ #category : #accessing }
BioWebClientEngine >> downloadUrl [
	" Answer a String decodeding the fields embedded in the url ?var1=val1&var2=val2 "

	^ self subclassResponsibility
]

{ #category : #accessing }
BioWebClientEngine >> httpGet [
	" Answer the response from the receiver's current url "
	
	^ (self classFor: self providerClass) httpGet: self downloadUrl
]

{ #category : #accessing }
BioWebClientEngine >> httpGet: urlString [
	"Get the response from the given url"
	" ( self httpGet: 'http://www.squeak.org') content "
	
	^ (self classFor: self providerClass) httpGet: urlString
]

{ #category : #accessing }
BioWebClientEngine >> httpGetContents [
	" Answer the String contents in the response from the receiver's current url "
	
	^ [ self httpGet contents ]
	on: MessageNotUnderstood
	do: [ : ex | self httpGet content ]
]

{ #category : #accessing }
BioWebClientEngine >> url [
	^ url
]

{ #category : #accessing }
BioWebClientEngine >> url: anObject [
	url := anObject
]

{ #category : #accessing }
BioWebClientEngine >> urlClass [
	" Answer a <Class> implementing an interpreted URL/URI "

	^ self class urlClass
]

{ #category : #accessing }
BioWebClientEngine >> urlFromString: aString [

	^ self urlClass fromString: aString.
]
