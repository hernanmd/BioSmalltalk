"
Abstract class representing a web wrapper (wraps objects in a web environment). A web environment contains at least an URL and a search result.

The default search result class is BioWebResult.
The default url class is BioUrl.

See subclasses for details.

"
Class {
	#name : #BioWebWrapper,
	#superclass : #BioWrapperObject,
	#instVars : [
		'url',
		'searchResult'
	],
	#category : #'BioWrappers-Core'
}

{ #category : #'accessing-private' }
BioWebWrapper class >> baseUrl [
	" Private - Answer a <String> specifying a server valid addres for the receiver "
	
	^ self subclassResponsibility
]

{ #category : #'accessing public' }
BioWebWrapper >> addParameters: aString [
	" Add the parameters in aString to the receiver's url object "
	
	"self url addParameters: aString"
	self url addPathSegment: aString
]

{ #category : #'accessing private' }
BioWebWrapper >> baseUrl [
	" Private - Answer a String specifying a server valid addres for the receiver "
	
	^ self class baseUrl
]

{ #category : #'accessing public' }
BioWebWrapper >> cmdName: aString [
	" Private - Set the receiver's url command (e.g. script.cgi) to be aString "

	self url cmdName: aString
]

{ #category : #'accessing private' }
BioWebWrapper >> database: aBioDatabase [
	"Set the receiver's database to be aBioDatabase. Answer aBioDatabase"

	self url dbName: aBioDatabase dbName.
	^ aBioDatabase
]

{ #category : #'accessing public' }
BioWebWrapper >> downloadUrl [
	" Answer a String with the receiver's current URL "
	^ self url downloadUrl
]

{ #category : #'accessing public' }
BioWebWrapper >> execute [
	" Execute current receiver's operation and answer a result object "
	
	| rs |

	rs := self searchResult executeFor: self.
	self lastStatus: 'Success'.
	^ rs
]

{ #category : #printing }
BioWebWrapper >> printOn: aStream [
	" Private - See superimplementor's comment "

	super printOn: aStream.
	self rawUrl ifNotNil: [ 
		aStream
			nextPutAll: (BioWebClientEngine decode: url asString)
			between: $[
			and: $] ]
]

{ #category : #'accessing public' }
BioWebWrapper >> queryAt: key put: queryString [
	"Modify the receiver's URL by setting a query variable key=value.
	If key is already exists, it is overwritten."
	
	self url queryAt: key put: queryString
]

{ #category : #'accessing private' }
BioWebWrapper >> rawUrl [
	" Answer the value of url "

	^ url
]

{ #category : #'accessing public' }
BioWebWrapper >> searchResult [
	" Answer a search result object "
	
	^ searchResult
		ifNil: [ searchResult := self searchResultClass newFrom: self ].
]

{ #category : #accessing }
BioWebWrapper >> searchResult: anObject [
	^ searchResult := anObject
]

{ #category : #'accessing private' }
BioWebWrapper >> searchResultClass [

	^ BioWebResult
]

{ #category : #'accessing private' }
BioWebWrapper >> url [
	"Answer the value of url"

	^ self rawUrl
		ifNil: [ url := BioWebClientEngine urlFromString: self baseUrl ]
]

{ #category : #'accessing private' }
BioWebWrapper >> url: anObject [
	"Set the value of url"

	url := anObject
]

{ #category : #'accessing private' }
BioWebWrapper >> urlClass [
	" Answer a <Class> implementing an interpreted URL/URI "

	^ BioUrl
]
