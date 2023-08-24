Class {
	#name : #BioAccessionParser,
	#superclass : #BioNCBIIdParser,
	#category : #'BioParsers-Core'
}

{ #category : #'instance creation' }
BioAccessionParser class >> tokenize: aString [
	" Tokenize aString using the receiver "
	
	^ self tokenizeAccession: aString
]

{ #category : #accessing }
BioAccessionParser >> accessionParser [
	" Answer a parser for parsing accession identifiers "

	| discardCharacters |
	
	discardCharacters := ( 
		( 'gb|' asPParser / 'emb|' asPParser / 'dbj|' asPParser / 'ref|' asPParser / 'sp|' asPParser ) /
		( 'gb|' asPParser negate plus , 'gb|' asPParser) / 
		( 'emb|' asPParser negate plus , 'emb|' asPParser ) /
		( 'dbj|' asPParser negate plus , 'dbj|' asPParser ) /
		( 'ref|' asPParser negate plus , 'ref|' asPParser ) /
		( 'sp|' asPParser negate plus , 'sp|' asPParser )
		) optional ==> [ :nodes | nil ].

	^ discardCharacters , self parserForAccession


]

{ #category : #'accessing private' }
BioAccessionParser >> buildResults: aCollection [
	" Answer a new accession object from results taken from aCollection "
	
	^ aCollection first
		ifNil: [ 	self accessionFrom: aCollection second ]
		ifNotNil: [ self accessionFrom: aCollection ]



]

{ #category : #accessing }
BioAccessionParser >> buildTokens: aCollection [
	" Answer a Collection object for the receiver's parsing output "

	aCollection first
		ifNil: [ self results: aCollection second ]
		ifNotNil: [ self results: aCollection ].
	^ self results		
]

{ #category : #initialization }
BioAccessionParser >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	parser := self accessionParser.
]

{ #category : #testing }
BioAccessionParser >> isAccession [
	" (BioAccessionParser on: 'AF288373.2') isAccession "

	^ (self parse: self expression) isNotEmpty
]

{ #category : #accessing }
BioAccessionParser >> tokenizeAccession: aString [
	" Refer to comment in class side "
	
	^ self class tokenizeAccession: aString
]
