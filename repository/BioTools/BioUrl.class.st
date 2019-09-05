"
A Uniform Resource Locator.  It specifies the location of a document on the Internet.  The base class is abstract; child classes break different types of URLs down in ways appropriate for that type.

A URL which has a hierarchical encoding.  For instance, http and ftp URLs are hierarchical.

A URL that can be accessed via the Hypertext Transfer Protocol (HTTP), ie, a standard Web URL

"
Class {
	#name : #BioUrl,
	#superclass : #ZnUrl,
	#instVars : [
		'webClient'
	],
	#category : #'BioTools-Core'
}

{ #category : #accessing }
BioUrl >> activate [
	" See superimplementor's comment "
	
	^ (self webClient httpGet: self downloadUrl) contents asString
]

{ #category : #deprecate }
BioUrl >> addParameters: aQueryString [
	" Append aQueryString as the receiver's database name "

	| params queryField |
	^ (params := (aQueryString findTokens: '=')) size = 2
		ifTrue: [ queryField := params first first = $& 
					ifTrue: [ params first allButFirst ]
					ifFalse: [ params first ].
			self & (queryField -> params last) ]
		ifFalse: [ self error ]
]

{ #category : #deprecate }
BioUrl >> buildUrl: pathPrefix with: aPath [
	" Append aString as the receiver's command name "

	| urlString |
	
	urlString := pathPrefix , aPath.
	self path removeLast.
	self path addLast: urlString
]

{ #category : #deprecate }
BioUrl >> cmdName: aCmdString [
	" Append aString as the receiver's command name "

	self addPathSegment: aCmdString
	"self buildUrl: aCmdString with: self path last.	"

]

{ #category : #deprecate }
BioUrl >> dbName: aString [
	" Append aString as the receiver's database name "

	self addPathSegment: aString
]

{ #category : #private }
BioUrl >> defaultWebClient [
	" Answer the current web client configured for the receiver "
	
	^ BioWebClientEngine for: self
]

{ #category : #converting }
BioUrl >> downloadUrl [
	" Answer a String decoding the fields embedded in the url ?var1=val1&var2=val2 "

	^ self webClient downloadUrl
]

{ #category : #deprecate }
BioUrl >> includesParameter: aString [
	" Answer <true> if the receiver already includes a parameter named aString "
	
	^ [ (self valueForParameter: aString) notNil ] 
		on: KeyNotFound 
		do: [ : ex | ex return: false ]
]

{ #category : #deprecate }
BioUrl >> urlTokens [
	" Answer a Collection of commonly used tokens in URLs "

	^ #($? $= $&)
]

{ #category : #deprecate }
BioUrl >> valueForParameter: aString [
	" Answer a Collection with the receiver's parameter names "

"	| parCol value |
	parCol := self path last findTokens: self urlTokens.
	(parCol first endsWith: 'cgi')
		ifTrue: [ parCol removeFirst ].
	parCol pairsDo: [ :k :v | 
		k asLowercase = aString asLowercase
			ifTrue: [ value := v ]  ].
	^ value"
	^ self queryAt: aString
]

{ #category : #accessing }
BioUrl >> webClient [

	^ webClient
		ifNil: [ webClient := self defaultWebClient ]
]

{ #category : #accessing }
BioUrl >> webClient: anObject [
	webClient := anObject
]
