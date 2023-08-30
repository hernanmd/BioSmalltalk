"
Abstract class for BioSmalltalk parsers
"
Class {
	#name : #BioAbstractParser,
	#superclass : #BioObject,
	#instVars : [
		'parser',
		'expression',
		'results',
		'status'
	],
	#category : #'BioParsers-Core'
}

{ #category : #'instance creation' }
BioAbstractParser class >> on: aString [
	" Answer a new instance of the receiver configured for parsing aString "

	^ self new initializeWith: aString
]

{ #category : #accessing }
BioAbstractParser >> beFailed [
	" Private - Set the receiver's status to <false>, meaning
	a failed operation was performed "
	
	status := false
]

{ #category : #accessing }
BioAbstractParser >> beSuccess [
	" Private - Set the receiver's status to <true>, meaning
	a successfull operation was performed "

	status := true
]

{ #category : #'accessing private' }
BioAbstractParser >> buildResults: aCollection [
	" Set the receiver's results using aCollection. Answer aCollection "
	
	self results: aCollection.
	^ aCollection

		
]

{ #category : #accessing }
BioAbstractParser >> buildTokens: aCollection [
	" Answer an identified object for the receiver's parsing output "

	self results: aCollection.
	^ self results
]

{ #category : #accessing }
BioAbstractParser >> debug [
	" Private - Debug the receiver's expression "
	
	(results isNil or: [ results isEmpty ])
		ifTrue: [ self debug: expression ].
	^ results
]

{ #category : #accessing }
BioAbstractParser >> debug: aString [
	" Debug aString with the receiver's parser "
	
	self debugString: aString.

]

{ #category : #accessing }
BioAbstractParser >> debugString: aString [
	" Answer an object with the result of parsing aString with the receiver's parser "
	
	self beSuccess.
	^ [ parser debug:  aString ]
		on: Exception
		do: [: ex | 
			self beFailed.
			ex asString ].

]

{ #category : #accessing }
BioAbstractParser >> expression [
	" Answer a String with the receiver's target expression "
	
	^ expression
]

{ #category : #accessing }
BioAbstractParser >> expression: anObject [
	expression := anObject
]

{ #category : #'initialize-release' }
BioAbstractParser >> initializeWith: aString [
	" Private - Set the receiver's target expression to be parsed to aString "
	
	self initialize.
	expression := aString
]

{ #category : #testing }
BioAbstractParser >> isSuccess [
	" Answer <true> if the last operation in the receiver was successfull "

	^ status
]

{ #category : #accessing }
BioAbstractParser >> parse [
	" Private - Parse the receiver's expression if necessary. Answer
	the result of parsing the expresion "
	
	(results isNil or: [ results isEmpty ])
		ifTrue: [ self parse: expression ].
	^ results
]

{ #category : #accessing }
BioAbstractParser >> parse: aString [
	" Answer an object with the result of parsing aString with the receiver's parser "
	
	| parseResults |
	parseResults := self parseString: aString.
	^ self isSuccess
		ifTrue: [ results := self buildResults: parseResults ]
		ifFalse: [ self signalInvalidObject: parseResults ].
]

{ #category : #accessing }
BioAbstractParser >> parseString: aString [
	" Answer an object with the result of parsing aString with the receiver's parser "
	
	self beSuccess.
	^ [ parser
			parse:  aString
			onError: [: failure | self error: failure message ] ]
		on: Error
		do: [: ex | 
			self beFailed.
			ex asString ].

]

{ #category : #'accessing private' }
BioAbstractParser >> parser [
	"Answer the value of parser"

	^ parser
]

{ #category : #'accessing private' }
BioAbstractParser >> parser: anObject [
	"Set the value of parser"

	parser := anObject
]

{ #category : #printing }
BioAbstractParser >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream
		space;
		nextPut: $[;
		nextPutAll: parser asString;
		nextPutAll: ' on: ';
		nextPutFirst: expression asString between: $" -> $";
		nextPutAll: ' results: ';
		nextPutAll: results asString;
		nextPut: $]
]

{ #category : #'accessing private' }
BioAbstractParser >> resultClass [
	" Answer a default class for storing the receiver's parsing results "
	
	^ OrderedCollection
]

{ #category : #accessing }
BioAbstractParser >> results [
	" Answer an object suitable for storing receiver's parsing results "

	^ results
		ifNil: [ results := self resultClass new ]
]

{ #category : #accessing }
BioAbstractParser >> results: anObject [
	results := anObject
]

{ #category : #accessing }
BioAbstractParser >> resultsForParse [
	" Answer an object suitable for storing receiver's parsing results "
	
	^ results
		ifNil: [ results := self parseResultClass new ]
]

{ #category : #accessing }
BioAbstractParser >> resultsForTokenize [
	" Answer an object suitable for storing receiver's parsing results "
	
	^ results
		ifNil: [ results := self tokenizeResultClass new ]
]

{ #category : #accessing }
BioAbstractParser >> rowsDo: aBlock [
	" Iterate over the receiver performing aBlock on each iteration "
	
	self parse.
	self results do: [ : each |
		each isNil ifFalse: [ aBlock value: each ] ].

]

{ #category : #accessing }
BioAbstractParser >> tokenize [
	" Private - Tokenize the receiver's expression if necessary "
	
	^ (results isNil or: [ results isEmpty ])
		ifTrue: [ self tokenize: expression ]
		ifFalse: [ self error: 'Results not empty' ]
]

{ #category : #accessing }
BioAbstractParser >> tokenize: aString [
	" Answer an object with the result of tokenizing aString with the receiver's parser "
	
	| parseResults |
	
	parseResults := self parseString: aString.
	^ self isSuccess
		ifTrue: [ self buildTokens: parseResults ]
		ifFalse: [ parseResults ].
]

{ #category : #'accessing private' }
BioAbstractParser >> tokenizeResultClass [
	" Answer the parse result class "
	
	^ OrderedCollection
]
