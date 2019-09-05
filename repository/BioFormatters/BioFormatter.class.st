"
Abstract superclass to group common formatter (writers) behavior. Defines properties like valid, description, samples, parser and delimiters.


"
Class {
	#name : #BioFormatter,
	#superclass : #BioObject,
	#instVars : [
		'parser',
		'samplesCollection',
		'delimiterSourceCharacter',
		'delimiterTargetCharacter',
		'isValid',
		'fileNamePrefix'
	],
	#category : #'BioFormatters-Core'
}

{ #category : #utilities }
BioFormatter class >> alphaCharacters [
	" Answer a Collection with alphabetic characters "

	^ ( CharacterSet allCharactersBut: self invalidCharacters ) asOrderedCollection
		select: [: chr | chr asciiValue < 128 ]
		thenCollect: [: each | each asString ].
]

{ #category : #utilities }
BioFormatter class >> invalidCharacters [
	" Answer a Collection with Characters without visible
	or invalid (i.e. used for starting comments) representation "

	^ { $# . Character space  . Character tab }
]

{ #category : #utilities }
BioFormatter class >> separators [
	" Answer a <Collection> with descriptions of invisible characters "

	^ self alphaCharacters
		addFirst: 'WHITESPACE';
		addFirst: 'TAB';
		addFirst: 'NONE';
		yourself.
]

{ #category : #private }
BioFormatter >> afterExport: anObject [
	" By default do nothing. This is implemented to let the receiver to perform after-export actions "

]

{ #category : #private }
BioFormatter >> beforeExport: anObject [
	" Answer <true> if pre-export actions are valid "
	
	^ true

]

{ #category : #'convenience-delimiters' }
BioFormatter >> delimiterSourceCharacter [
	" Answer a <Character> used to delimit fields in the receiver "
	
	^ delimiterSourceCharacter
		ifNil: [ delimiterSourceCharacter := $; ]
]

{ #category : #'convenience-delimiters' }
BioFormatter >> delimiterSourceCharacter: aCharacter [
	" Set the <Character> to delimit fields in the receiver source data to be aCharacter "

	delimiterSourceCharacter := aCharacter
]

{ #category : #'convenience-delimiters' }
BioFormatter >> delimiterTargetCharacter [
	" Answer a <Character> used to replace the receiver's delimiter in the receiver "
	
	^ delimiterTargetCharacter
		ifNil: [ delimiterTargetCharacter := $, ]
]

{ #category : #'convenience-delimiters' }
BioFormatter >> delimiterTargetCharacter: anObject [
	delimiterTargetCharacter := anObject
]

{ #category : #accessing }
BioFormatter >> description [
	" Answer a <String> for identifying the receiver "
	
	^ self class description
]

{ #category : #'convenience-delimiters' }
BioFormatter >> escapeDelimiters: aString [
	" Answer a <String> replacing the receiver's #delimiter with #replacementDelimiter in aString "
	
	| answer |
	((answer := aString) includes: self delimiterSourceCharacter)
		ifTrue: [ answer := answer 
				copyReplaceAll: self delimiterSourceCharacter asString 
				with: self delimiterTargetCharacter asString ].
	^ answer

]

{ #category : #accessing }
BioFormatter >> fileNamePrefix [

	^ fileNamePrefix
		ifNil: [ fileNamePrefix := String empty ]
]

{ #category : #accessing }
BioFormatter >> fileNamePrefix: anObject [
	fileNamePrefix := anObject
]

{ #category : #testing }
BioFormatter >> isValid [
	" Answer <false> by default because assume receiver's was not #validate: "

	^ isValid
		ifNil: [ isValid := false ]
]

{ #category : #accessing }
BioFormatter >> parser [
	^ parser
]

{ #category : #accessing }
BioFormatter >> parser: anObject [
	parser := anObject
]

{ #category : #printing }
BioFormatter >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	aStream 
		nextPutAll: self description 
		between: Character space 
		and: Character space

]

{ #category : #accessing }
BioFormatter >> samples [

	^ samplesCollection
		ifNil: [ samplesCollection := OrderedCollection new ]
]

{ #category : #accessing }
BioFormatter >> samples: aCollection [

	samplesCollection := aCollection
]
