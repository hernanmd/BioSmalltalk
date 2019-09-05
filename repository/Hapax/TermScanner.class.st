Class {
	#name : #TermScanner,
	#superclass : #Object,
	#instVars : [
		'stream',
		'buffer',
		'term'
	],
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #'instance creation' }
TermScanner class >> new [

	^self basicNew initialize
]

{ #category : #running }
TermScanner class >> scan: input [

	^self new
		onStream: input readStream;
		allTerms
]

{ #category : #running }
TermScanner >> allTerms [

	| bag |
	bag := Terms new.
	[ self atEnd ] whileFalse: [ bag add: self next ].
	^bag
]

{ #category : #scanning }
TermScanner >> atEnd [

	term == Terms void ifTrue: [ term := self privateNext ].
	^term isNil
]

{ #category : #'initialize-release' }
TermScanner >> initialize [

	buffer := String new writeStream
]

{ #category : #scanning }
TermScanner >> next [

	^term == Terms void 
		ifTrue: [ self privateNext ]
		ifFalse: [ 
			| result |
			result := term.
			term := Terms void.
			result ].
]

{ #category : #running }
TermScanner >> onFile: filename [

	self onStream: filename asFilename readStream
]

{ #category : #running }
TermScanner >> onStream: input [

	stream := input.
	term :=  Terms void.
]

{ #category : #running }
TermScanner >> onString: text [

	self onStream: text readStream
]

{ #category : #private }
TermScanner >> privateNext [

	| next |
	buffer reset.
	[	
		[ (next := stream next) isLetter ] whileFalse.
		[ buffer nextPut: next asLowercase.
		  (next := stream next) isLetter ] whileTrue.
		[ (next := stream next) isLetter ] whileFalse.
		stream skip: -1 ]
		on: MessageNotUnderstood 
		do: [ :ex | ex message selector = #isLetter ifFalse: [ex signal]].
	^buffer isEmpty 
		ifTrue: [ nil ]
		ifFalse: [ buffer contents ]
]

{ #category : #accessing }
TermScanner >> stream [

	^stream
]
