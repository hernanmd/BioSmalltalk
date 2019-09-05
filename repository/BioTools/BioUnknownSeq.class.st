"
BioUnknownSeq is a convenient sequence object for representing unknown sequences efficently through only storing the length.

Instance Variables:
	size		<Integer>

"
Class {
	#name : #BioUnknownSeq,
	#superclass : #BioMutableSeq,
	#instVars : [
		'size'
	],
	#category : #'BioTools-Sequences'
}

{ #category : #'instance creation' }
BioUnknownSeq class >> new: sizeRequested [
	" Answer a new instance of the receiver of sizeRequested length "
	
	^ self new size: sizeRequested
]

{ #category : #converting }
BioUnknownSeq >> asString [
	" Answer a <String> with the receiver's sequence "
	
	^ BioObject 
		generateJoin: self unknownLetter 
		repeat: self size
]

{ #category : #accessing }
BioUnknownSeq >> complementary [
	" Answer a <String> with the complement of the receiver's sequence "
	
	^ self sameSequence

]

{ #category : #'initialize-release' }
BioUnknownSeq >> initializeWith: aString [
	" Private - Initialize the receiver's sequence to be aString "
	
	size := aString size.
	alphabet := self defaultAlphabetClass new.
]

{ #category : #printing }
BioUnknownSeq >> printOn: aStream [
	" Private - See superimplementor's comment "

	| title |
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: [ 'an ' ] ifFalse: [ 'a ' ]);
		nextPutAll: title.
	aStream 
		nextPutAll: self alphabet asString between: $( and: $);
		space;
		nextPutAll: self asString between: $[ and: $]
]

{ #category : #'accesing public - protein synthesis' }
BioUnknownSeq >> reversed [
	" Answer a copy of the receiver with element order reversed "
	
	^ self sameSequence
]

{ #category : #'accessing private' }
BioUnknownSeq >> sameSequence [
	" Answer a <String> with the same letter used in all receiver's positions "
	
	^ String streamContents: [ : stream |
		size timesRepeat: [ stream nextPut: self unknownLetter ] ]
]

{ #category : #accessing }
BioUnknownSeq >> size [
	" Answer how many elements the receiver contains "

	^ size
]

{ #category : #accessing }
BioUnknownSeq >> size: anInteger [
	" Set how many elements the receiver contains "

	size := anInteger
]

{ #category : #'accessing private' }
BioUnknownSeq >> unknownLetter [
	" Answer a <Character> with the default letter used when a letter in a position in the sequence is unknown "
	
	^ self alphabet unknownLetter
]

{ #category : #'accessing private' }
BioUnknownSeq >> unknownLetter: aCharacter [
	" Set aCharacter as the default letter used when a letter in a position in the sequence is unknown "

	^ self alphabet unknownLetter: aCharacter
]
