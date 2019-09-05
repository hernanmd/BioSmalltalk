Class {
	#name : #BioAccessionParser,
	#superclass : #BioNCBIIdParser,
	#category : 'BioParsers-Core'
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
		( 'gb|' asParser / 'emb|' asParser / 'dbj|' asParser / 'ref|' asParser / 'sp|' asParser ) /
		( 'gb|' asParser negate plus , 'gb|' asParser) / 
		( 'emb|' asParser negate plus , 'emb|' asParser ) /
		( 'dbj|' asParser negate plus , 'dbj|' asParser ) /
		( 'ref|' asParser negate plus , 'ref|' asParser ) /
		( 'sp|' asParser negate plus , 'sp|' asParser )
		) optional answer: nil.

	^ discardCharacters , self parserForAccession


]

{ #category : #accessing }
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

{ #category : #'initialize-release' }
BioAccessionParser >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	parser := self accessionParser.
]

{ #category : #testing }
BioAccessionParser >> isAccession [
	" (BioAccessionParser on: 'AF288373.2') isAccession "
	
	^ (self parse: self expression) isEmpty not
]

{ #category : #accessing }
BioAccessionParser >> tokenizeAccession: aString [
	" Refer to comment in class side "
	
	^ self class tokenizeAccession: aString
]
