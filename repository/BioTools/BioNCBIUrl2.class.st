Class {
	#name : #BioNCBIUrl2,
	#superclass : #BioUrl,
	#category : 'BioTools-Core'
}

{ #category : #accessing }
BioNCBIUrl2 >> addParameters: aQueryString [
	" Append aQueryString in the receiver's parameters "

	self addParameters: aQueryString delimiter: '&'

]

{ #category : #accessing }
BioNCBIUrl2 >> addParameters: aQueryString delimiter: aDelimiterStirng [
	" Append aString as the receiver's database name "

	| queryFragment |
	queryFragment := self path last , aDelimiterStirng , aQueryString.
	self path removeLast.
	self path addLast: queryFragment
]

{ #category : #accessing }
BioNCBIUrl2 >> dbName [
	" Answer a String with the receiver's database name, if it was configured "

	^self valueForParameter: 'DATABASE'
]

{ #category : #accessing }
BioNCBIUrl2 >> parameters [
	" Answer a Collection with the receiver's parameter names "

	^ self path last findTokens: self urlTokens.

]

{ #category : #accessing }
BioNCBIUrl2 >> rid [
	" Answer a String with the receiver's RID value, if it was configured "

	^ self valueForParameter: 'RID'
]

{ #category : #accessing }
BioNCBIUrl2 >> setParameters: aQueryString [
	" Add or modify aQueryString in the receiver's parameters "

	| paramName |
	
	paramName := aQueryString copyUpTo: $=.
	(self parameters includes: paramName)
		ifFalse: [ self addParameters: aQueryString ]
		ifTrue: [ 
			| params pos |
			params := self path last findTokens: self urlTokens keep: self urlTokens.
			pos := (params indexOf: paramName) + 2.
			params at: pos put: (aQueryString copyAfter: $=).
			self path removeLast.
			self path addLast: (params joinUsing: String empty) ]

]

{ #category : #accessing }
BioNCBIUrl2 >> startParameters: aQueryString [
	" Add aQueryString as the start parameter in the receiver's parameters "

	"self addParameters: aQueryString delimiter: '?'."
	| keyAndValue |
	keyAndValue := aQueryString findTokens: '='.
	^ self ? (keyAndValue first -> keyAndValue last).

]
