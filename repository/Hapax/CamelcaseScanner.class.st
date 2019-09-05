Class {
	#name : #CamelcaseScanner,
	#superclass : #TermScanner,
	#instVars : [
		'next'
	],
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #example }
CamelcaseScanner class >> bible [

	^self new onFile: 'bible10.txt'; allTerms
]

{ #category : #'initialize-release' }
CamelcaseScanner >> onStream: input [

	super onStream: input.
	next := Character space.
]

{ #category : #private }
CamelcaseScanner >> privateNext [

	| sel |
	next isNil ifTrue: [ ^nil ].
	buffer reset.
	[	
		self xWhitespace.
		next isLowercase 
			ifTrue: [ self xLowercaseWord ]
			ifFalse: [ self xCapitalizedWord ]]
		on: MessageNotUnderstood 
		do: [ :ex | sel := ex message selector. 
				(sel = #isLowercase or: [sel = #asLowercase or: [sel = #isLetter or: [sel = #isAlphaNumeric]]]) ifFalse: [self halt]].
	^buffer isEmpty 
		ifTrue: [ nil ]
		ifFalse: [ buffer contents ].
]

{ #category : #private }
CamelcaseScanner >> xCapitalizedWord [

	buffer nextPut: next.
	next := stream next.
	next isLetter ifTrue: [
		next isLowercase
			ifTrue: [ 
				buffer collection at: 1 put: buffer collection first asLowercase.
				self xLowercaseWord ]
			ifFalse: [ self xUppercaseWord ]]
]

{ #category : #private }
CamelcaseScanner >> xLowercaseWord [

	[	buffer nextPut: next.
		next := stream next.
		next isLowercase ] whileTrue.
]

{ #category : #private }
CamelcaseScanner >> xUppercaseWord [

	[	| peek |
		peek := stream peek.
		next isLetter and: [ 
		peek == nil or: [ peek isLowercase not ]]] whileTrue: [ 
			buffer nextPut: next. next := stream next. ]
]

{ #category : #private }
CamelcaseScanner >> xWhitespace [

	| previous |
	next isLetter ifFalse: [
		[	previous := next.
			next := stream next.
			($0 == next and: [ previous isSeparator ]) ifTrue: [ self xZeroWord ].
			next isLetter ] whileFalse ].
]

{ #category : #private }
CamelcaseScanner >> xZeroWord [

	[ next isAlphaNumeric ] whileTrue: [ next := stream next ].
]
