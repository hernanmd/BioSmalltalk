"
Represents a generic alphabet, used by default instantiations. An alphabet can configure its unkown letters or symbols by #unknownLetter:

"
Class {
	#name : #BioAlphabet,
	#superclass : #BioObject,
	#instVars : [
		'unknownElement'
	],
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioAlphabet class >> allCodes [
	" Answer a Collection with all biologically relevant letters "
	
	^ (self allFinalClasses collect: #codes) joinUsing: String empty
]

{ #category : #accessing }
BioAlphabet class >> ambiguityCodes [
	" Answer a String containing common used letters in sequences with 	no meaning for the receiver "
	
	^ '-.?XxNn'
]

{ #category : #accessing }
BioAlphabet class >> codes [
	" Answer a Collection with all biologically relevant letters "
	
	^ self subclassResponsibility
]

{ #category : #accessing }
BioAlphabet class >> colorMap [
	" Answer a <Dictionary> with mappings of each receiver's letter to an instance of <Color>  "
	
	^ (((Color defaultColors2 atAll: (
		(1 to: Color defaultColors2 size by: 4) asArray))
			first: self codes size) 
				with: self codes 
				collect: [ : colorSym : letter | letter -> (Color perform: colorSym) ]) asDictionary.
]

{ #category : #accessing }
BioAlphabet class >> colorSet [
	" See comment in #colorSet: "
	
	^ ((Color defaultColors3 atAll: (
		(1 to: Color defaultColors3 size by: 4) asArray))
			first: self codes size) collect: [ : colorSym | 
				Color perform: colorSym ].
]

{ #category : #accessing }
BioAlphabet class >> colorSet: colorSetSym [
	" Answer a <Collection> with <Color> elements to be applied to each of the receiver's letters. The code relies on the #defaultColiors set of methods implemented in Color class. These methods answer a <Collection> with color names as symbols representing a Color implemented in class side. The Collection currently returns the color name every 5 elements, remaining elements are RGB values. "
	
	^ (((Color perform: colorSetSym) atAll: (
		(1 to: (Color perform: colorSetSym) size by: 4) asArray))
			first: self codes size) collect: [ : colorSym | 
				Color perform: colorSym ].
]

{ #category : #'instance creation' }
BioAlphabet class >> for: aString [
	" Answer a new instance of the receiver using the sequence aString "
	
	^ self basicNew
]

{ #category : #accessing }
BioAlphabet class >> guessAlphabetFrom: aString [
	" Answer a class with the guessed alphabet from analyzing aString "
	
	<lint: 'Long methods' rationale: 'Algorithm method' author: 'HernanMoralesDurand'>
	<lint: 'Temporary variable names' rationale: 'Algorithm method' author: 'HernanMoralesDurand'>
	
	| normalizedString atgcCount total |
	
	normalizedString := aString asLowercase copyWithoutAll: self ambiguityCodes.
	atgcCount := 'atgcn' inject: 0 into: [ : sum : each | sum + (normalizedString occurrencesOf: each) ].
	(total := aString size) = 0
		ifTrue: [ self signalInvalidObject: 'Empty sequence, cannot guess alphabet' translated ].
	
	^ (atgcCount / total) > self guessAlphabetThreshold
		ifTrue: [ 
			(BioIUPACAmbiguousDNA hasAmbiguousBases: aString)
				ifTrue: [ BioIUPACAmbiguousDNA ]
				ifFalse: [ BioIUPACUnambiguousDNA ] ]
		ifFalse: [ 
			(atgcCount + (normalizedString occurrencesOf: $u)) / total > self guessAlphabetThreshold
				ifTrue: [ 
					(BioIUPACAmbiguousRNA hasAmbiguousBases: aString)
						ifTrue: [ BioIUPACAmbiguousRNA ]
						ifFalse: [ BioIUPACUnambiguousRNA ] ]
				ifFalse: [ BioIUPACProtein ] ]

]

{ #category : #private }
BioAlphabet class >> guessAlphabetThreshold [
	" Answer a consensus Float for determining the alphabet type.
	This value currently follows BioPerl convention, guess DNA if % of ATGC is > this value.
	Override this method to work with a different threshold "
	
	^ 0.85
]

{ #category : #testing }
BioAlphabet class >> hasAmbiguousBases: aString [
	" Answer <true> if receiver contains ambiguity codes "

	^ aString asUppercase anySatisfy: [ : letter | self ambiguityCodes includes: letter ]
]

{ #category : #comparing }
BioAlphabet >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	^ self class = anObject class
]

{ #category : #accessing }
BioAlphabet >> allCodes [
	" Answer a <String> with the receiver's allowed letters "

	^ self class allCodes
]

{ #category : #accessing }
BioAlphabet >> ambiguityCodes [
	" Answer a <String> with the ambiguity codes for the receiver's alphabet "
	
	^ self class ambiguityCodes
]

{ #category : #testing }
BioAlphabet >> canTranslate [
	" Answer <true> if the receiver can be translated into proteins (amino acid sequences) "
	
	^ false
]

{ #category : #accessing }
BioAlphabet >> codes [
	" Answer a <String> with the receiver's allowed letters "

	^ self class codes
]

{ #category : #accessing }
BioAlphabet >> defaultUnknownElement [
	" Private - Answer a <Character> used as representative of unknown elements in the receiver "
	
	^ $N
]

{ #category : #testing }
BioAlphabet >> hasAmbiguousBases: aString [
	" Answer <true> if receiver contains ambiguity codes "
	
	^ self class hasAmbiguousBases: aString
]

{ #category : #testing }
BioAlphabet >> isDNA [
	" Answer <true> if the receiver describes a DNA alphabet "
	
	^ false
]

{ #category : #testing }
BioAlphabet >> isProtein [
	" Answer <true> if the receiver describes a Protein alphabet "
	
	^ false
]

{ #category : #testing }
BioAlphabet >> isRNA [
	" Answer <true> if the receiver describes a RNA alphabet "

	^ false
]

{ #category : #accessing }
BioAlphabet >> size [
	" Answer the number of letters in the receiver "
	
	^ self codes size
]

{ #category : #accessing }
BioAlphabet >> sortedCodes [
	" Answer a <String> with the receiver's allowed letters sorted lexicographically "

	^ self codes asSortedCollection joinUsing: ''
]

{ #category : #accessing }
BioAlphabet >> unknownLetter [
	" Answer a representative <Character> when a letter in the receiver is unknown "

	^ unknownElement
		ifNil: [ unknownElement := self defaultUnknownElement ]
]

{ #category : #accessing }
BioAlphabet >> unknownLetter: aCharacter [
	" Set aCharacter as representative when a letter in the receiver is unknown "

	unknownElement := aCharacter
]
