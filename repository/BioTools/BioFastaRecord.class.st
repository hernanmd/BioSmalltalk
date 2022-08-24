Class {
	#name : #BioFastaRecord,
	#superclass : #BioNamedObject,
	#instVars : [
		'sequence',
		'identifiers'
	],
	#category : #'BioTools-Core'
}

{ #category : #'instance creation' }
BioFastaRecord class >> named: aBioObject sequence: aSequence [
	" Answer a new instance of the receiver with header line aNameString and aSeqString as sequence "
	
	^ self new
			initializeName: aBioObject asString 
			sequence: aSequence;
			yourself
]

{ #category : #'instance creation' }
BioFastaRecord class >> named: aBioObject sequence: aSequence alphabet: anAlphabetString [
	" Answer a new instance of the receiver with header line
	aNameString and aSeqString as sequence "
	
	^ self new
			initializeName: aBioObject asString 
			sequence: aSequence 
			alphabet: anAlphabetString;
			yourself
]

{ #category : #comparing }
BioFastaRecord >> <= aBioFastaRecord [
	" Answer whether the receivers's sequence name sorts before aString.
	The collation order is simple ascii (with case differences). "
	
	^ self name <= aBioFastaRecord name
]

{ #category : #comparing }
BioFastaRecord >> = aFastaRecord [
	" Two fasta records are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the same name.
	 (c) they have the same sequences "
	
	self == aFastaRecord ifTrue: [ ^ true ].
	self class = aFastaRecord class ifFalse: [ ^ false ].
	self name = aFastaRecord name ifFalse: [ ^ false ] .
	^ self sequence = aFastaRecord sequence
]

{ #category : #accessing }
BioFastaRecord >> addIdentifiers: aCollection [

	aCollection allButLast ifNotEmpty: [ 
		aCollection allButLast pairsDo: [ :k :v |
			self identifiers at: k put: v ] ]
]

{ #category : #accessing }
BioFastaRecord >> alphabet: aBioAlphabetClass [
	" Set the receiver's sequence alphabet to aBioAlphabetClass "
	
	self sequence alphabet: aBioAlphabetClass new
]

{ #category : #converting }
BioFastaRecord >> asFastaRecord [
	" Answer a <BioFastaRecord> "

	^ self
]

{ #category : #converting }
BioFastaRecord >> asString [
	" Answer the String representation of the receiver." 	
	
	^ String streamContents: [ : stream |
		stream 
			nextPut: $>;
			nextPutAll: self name;
			cr;
			nextPutAll: self sequence asString;
			cr ]
]

{ #category : #accessing }
BioFastaRecord >> dnaMwDoubleCircular [
	| mw_direct_strand |

	(mw_direct_strand := self molecularWeight) size = 1
		ifTrue: [ 
			| mw |
			mw := mw_direct_strand at: 1.
"			mw = mw.toFixed(2)."
			^ mw , ' Da' ]
		ifFalse: [ 
			mw_direct_strand size = 2
				ifTrue: [ 
					| mw_lower mw_upper |
					mw_lower := mw_direct_strand at: 1.
					mw_upper := mw_direct_strand at: 2.
"					mw_lower = mw_lower.toFixed(2).
					mw_upper = mw_upper.toFixed(2).
"					^ mw_lower , ' to ' , mw_upper , ' Da' ] ]		

]

{ #category : #accessing }
BioFastaRecord >> dnaMwDoubleLinear [
	| mw_direct_strand |

	(mw_direct_strand := self molecularWeight) size = 1
		ifTrue: [ 
			| mw |
			mw := mw_direct_strand at: 1.
"			mw = mw.toFixed(2)."
			^ mw , ' Da' ]
		ifFalse: [ 
			mw_direct_strand size = 2
				ifTrue: [ 
					| mw_lower mw_upper |
					mw_lower := mw_direct_strand at: 1.
					mw_upper := mw_direct_strand at: 2.
"					mw_lower = mw_lower.toFixed(2).
					mw_upper = mw_upper.toFixed(2).
"					^ mw_lower , ' to ' , mw_upper , ' Da' ] ]		

]

{ #category : #accessing }
BioFastaRecord >> dnaMwSingleCircular [
	| oh mw_direct_strand |

	oh := 17.01.
	(mw_direct_strand := self molecularWeight) size = 1
		ifTrue: [ 
			| mw |
			mw := (mw_direct_strand at: 1) - oh.
"			mw = mw.toFixed(2)."
			^ mw , ' Da' ]
		ifFalse: [ 
			mw_direct_strand size = 2
				ifTrue: [ 
					| mw_lower mw_upper |
					mw_lower := (mw_direct_strand at: 1) - oh.
					mw_upper := (mw_direct_strand at: 2) - oh.
"					mw_lower = mw_lower.toFixed(2).
					mw_upper = mw_upper.toFixed(2).
"					^ mw_lower , ' to ' , mw_upper , ' Da' ] ]		

]

{ #category : #accessing }
BioFastaRecord >> dnaMwSingleLinear [
	| mw_direct_strand |

	(mw_direct_strand := self molecularWeight) size = 1
		ifTrue: [ 
			| mw |
			mw := mw_direct_strand at: 1.
"			mw = mw.toFixed(2)."
			^ mw , ' Da' ]
		ifFalse: [ 
			mw_direct_strand size = 2
				ifTrue: [ 
					| mw_lower mw_upper |
					mw_lower := mw_direct_strand at: 1.
					mw_upper := mw_direct_strand at: 2.
"					mw_lower = mw_lower.toFixed(2).
					mw_upper = mw_upper.toFixed(2).
"					^ mw_lower , ' to ' , mw_upper , ' Da' ] ]		

]

{ #category : #accessing }
BioFastaRecord >> dumpToStream: aStream [
	" Private - Write the receiver's contents into aStream "
	
	aStream
		nextPut: $>;
		nextPutAll: self sequenceName;
		bioCr;
		nextPutAll: self sequenceString;
		bioCr
]

{ #category : #accessing }
BioFastaRecord >> gcContent [
	" Refer to comment in #gcContent "
	
	^ self sequence gcContent
]

{ #category : #testing }
BioFastaRecord >> hasGaps [

	^ self sequenceString includes: '-'
]

{ #category : #comparing }
BioFastaRecord >> hash [
	" Private - hash is implemented because #= is implemented "

	^ self identifiers hash bitXor: self sequence hash
]

{ #category : #accessing }
BioFastaRecord >> identifiers [
	"Answer a <Collection> of identifiers of the receiver"

	^ identifiers
		ifNil: [ identifiers := Dictionary new ]
]

{ #category : #accessing }
BioFastaRecord >> identifiers: aCollection [
	" Set the receiver's identifiers to aCollection "

	identifiers := aCollection
]

{ #category : #'initialize-release' }
BioFastaRecord >> initializeName: aNameString sequence: aString [
	" Private - Initialize the receiver's name and sequence "
	
	self name: aNameString.
	self sequence: (aString asSequenceForAlphabet: BioNullAlphabet).
]

{ #category : #'initialize-release' }
BioFastaRecord >> initializeName: aNameString sequence: aString alphabet: anAlphabet [
	" Private - Initialize the receiver's name, sequence and alphabet "
	
	self name: aNameString.
	self sequence: (aString asSequenceForAlphabet: anAlphabet).
]

{ #category : #testing }
BioFastaRecord >> isEmpty [
	" Answer <true> if the receiver does not contain either a name / header description or a sequence "
	
	^ self hasName not and: [ self sequenceString isEmpty not ]
]

{ #category : #testing }
BioFastaRecord >> isFastaRecord [
	" See superimplementor's comment "

	^ true
]

{ #category : #accessing }
BioFastaRecord >> molecularWeight [

	^ self sequence hasAmbiguousBases
		ifTrue: [ self sequence molecularWeightDegen ]
		ifFalse: [ self sequence molecularWeightNonDegen ]		
]

{ #category : #accessing }
BioFastaRecord >> occurrencesOfLetters [
	"Answer a <Dictionary> of occurrence mappings for the receiver "

	^ self sequence occurrencesOfLetters
]

{ #category : #printing }
BioFastaRecord >> printOn: aStream [
	" Private - See superimplementor's comment "

	super printOn: aStream.
	aStream 
		space;
		nextPutAll: self name.
]

{ #category : #accessing }
BioFastaRecord >> reverseComplement [
	" Answer a copy of the receiver's sequence complemented and with element order reversed. "
	
	| newInstance |
	
	newInstance := self class basicNew.
	^ newInstance 
		initializeName: self sequenceName
		sequence: self sequence reverseComplement
		alphabet: self sequence alphabet;
		yourself
]

{ #category : #accessing }
BioFastaRecord >> sequence [
	" Answer a BioSequence "
	
	^ sequence
]

{ #category : #accessing }
BioFastaRecord >> sequence: aBioSequence [
	" Set the receiver's sequence to aBioSequence "
	
	sequence := aBioSequence
]

{ #category : #accessing }
BioFastaRecord >> sequenceName [
	" Answer a <String> with the receiver's sequence header "
	
	| seqName |
	
	^ ((seqName := self name) beginsWith: '>')
		ifTrue: [ seqName allButFirst ]
		ifFalse: [ seqName ]
]

{ #category : #accessing }
BioFastaRecord >> sequenceNameWithoutDelimiter [
	" Answer a <String> with the receiver's sequence header without the $> character "
	
	^ self name allButFirst
]

{ #category : #accessing }
BioFastaRecord >> sequenceString [
	" Answer a <String> with the receiver's sequence "
	
	^ sequence asString
]

{ #category : #accessing }
BioFastaRecord >> size [
	" Answer a <Number> with the size of the receiver's sequence "

	^ self sequence size
]
