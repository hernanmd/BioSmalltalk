"
Abstract class to represent repetitive sequences.


	repeats 				<Number> 	How many times the motif is repeated
	repeatStructure:		<Symbol>	 	#simple, #compound


"
Class {
	#name : #BioRepeatSequence,
	#superclass : #BioSequence,
	#instVars : [
		'genotype',
		'repeats',
		'locus',
		'repeatStructure',
		'maxMotifSize',
		'minMotifSize'
	],
	#category : #'BioTools-Repeats'
}

{ #category : #'instance creation' }
BioRepeatSequence class >> name: nameString sequence: seqString motif: motifString repeats: repNumber [
	" Answer a new object representing a tandem repeat sequence "
	
	^ (self newAmbiguousDNA: seqString named: nameString)
		motif: motifString;
		repeats: repNumber;
		yourself
]

{ #category : #'instance creation' }
BioRepeatSequence class >> name: nameString sequence: seqString motif: motifString repeats: repNumber repeatStartPosition: repStartNumber [
	" Answer a new object representing a tandem repeat sequence "
	
	^ (self newAmbiguousDNA: seqString named: nameString)
		motif: motifString;
		repeats: repNumber;
		start: repStartNumber;
		yourself
]

{ #category : #'instance creation' }
BioRepeatSequence class >> newLocus: aBioLocus markers: anObject [
	" Answer a new object representing a Microsatellite marker "
	
	^ self new
		locus: aBioLocus;
		positions: anObject;
		yourself
]

{ #category : #'instance creation' }
BioRepeatSequence class >> newMotif: motifString repeats: repNumber [
	" Answer a new object representing a tandem repeat sequence "
	
	^ self new
		motif: motifString;
		repeats: repNumber;
		yourself
]

{ #category : #converting }
BioRepeatSequence >> asString [
	" Answer a <String> with the receiver's sequence "
	
	^ self generateJoin: self motif repeat: self repeats

]

{ #category : #'accessing - public' }
BioRepeatSequence >> beCompoundRepeat [

	self repeatStructure: #compound
]

{ #category : #'accessing - public' }
BioRepeatSequence >> beSimpleRepeat [

	self repeatStructure: #simple
]

{ #category : #accessing }
BioRepeatSequence >> end [
	" Answer an <Integer> with the receiver's genotype end position "
	
	^ self genotype end
]

{ #category : #accessing }
BioRepeatSequence >> end: anObject [
	" Set anObject as the receiver's genotype end position "
	
	^ self genotype end:  (self validatePosition: anObject)
]

{ #category : #accessing }
BioRepeatSequence >> genotype [
	" Answer a <BioGenotype> representing the receiver's genotype "

	^ genotype
		ifNil: [ genotype := BioGenotype new ]
]

{ #category : #accessing }
BioRepeatSequence >> genotype: aBioGenotype [

	genotype := aBioGenotype
]

{ #category : #testing }
BioRepeatSequence >> isCompoundRepeat [
	" Answer <true> if receiver repeat structure is compound "

	^ self repeatStructure = #compound
]

{ #category : #testing }
BioRepeatSequence >> isSimpleRepeat [
	" Answer <true> if receiver repeat structure is simple "

	^ self repeatStructure = #simple
]

{ #category : #accessing }
BioRepeatSequence >> locus [
	" Answer the receiver's <BioLocus> "

	^ locus
]

{ #category : #accessing }
BioRepeatSequence >> locus: aBioLocus [
	" Set the receiver's locus to aBioLocus "
	
	locus := aBioLocus
]

{ #category : #accessing }
BioRepeatSequence >> locusName [
	" Answer a <String> with receiver's locus name "
	
	^ self locus name
]

{ #category : #defaults }
BioRepeatSequence >> maxMotifSize [
	" See comment in #defaultMotifRange "
	
	^ maxMotifSize
		ifNil: [ maxMotifSize := self defaultMaxMotifSize ]
]

{ #category : #defaults }
BioRepeatSequence >> minMotifSize [
	" See comment in #defaultMotifRange "
	
	^ minMotifSize
		ifNil: [ minMotifSize := self defaultMinMotifSize ]
]

{ #category : #accessing }
BioRepeatSequence >> motif [
	" See comment in #sequence "

	^ self sequence
]

{ #category : #accessing }
BioRepeatSequence >> motif: aString [
	" See comment in #sequence: "
	
	self assert: [ aString size between:  self minMotifSize and: self maxMotifSize ] description: 'Repeat sequence range check'.
	self sequence: aString
]

{ #category : #defaults }
BioRepeatSequence >> motifRange [
	" Answer an <Interval> representing the size range allowed for the receiver, using as reference: Microsatellite definition at the US National Library of Medicine Medical Subject Headings (MeSH) "

	^ self minMotifSize to: self maxMotifSize

]

{ #category : #accessing }
BioRepeatSequence >> motifSize [
	" Answer a <Number> with the size of the repeat motif "
	
	^ self motif size

]

{ #category : #private }
BioRepeatSequence >> nullValue [

	^ 9 negated
]

{ #category : #accessing }
BioRepeatSequence >> positions [
	" Answer an <Association> with receiver's allelic positions "

	^ self start -> self end 
]

{ #category : #accessing }
BioRepeatSequence >> positions: anObject [
	
	anObject setMicrosatelliteGenotypeFor: self
]

{ #category : #printing }
BioRepeatSequence >> printOn: aStream [
    " Private - See superimplementor's comment "
   
    super printOn: aStream.
    self locus notNil
        ifTrue: [
            aStream
                nextPutAll: ' - ';
                nextPutAll: self locusName; space ].
"    self genotype notNil
        ifTrue: [ aStream
                        nextPutAll: ' - ';
                        nextPutAll: self genotype asString; space ].
    (self alleleRangeStart notNil and: [ self alleleRangeEnd notNil  ])
        ifTrue: [
            aStream
                space;
                nextPutAll: self alleleRangeStart asString;
                nextPutAll: ' - ';
                nextPutAll: self alleleRangeEnd asString ]"

]

{ #category : #'accessing - private' }
BioRepeatSequence >> repeatStructure [
	^ repeatStructure
]

{ #category : #'accessing - private' }
BioRepeatSequence >> repeatStructure: aSymbol [

	repeatStructure := aSymbol
]

{ #category : #accessing }
BioRepeatSequence >> repeats [
	^ repeats
]

{ #category : #accessing }
BioRepeatSequence >> repeats: anObject [
	repeats := anObject
]

{ #category : #accessing }
BioRepeatSequence >> start [
	" Answer an <Integer> with the receiver's genotype start position "
	
	^ self genotype start
]

{ #category : #accessing }
BioRepeatSequence >> start: anObject [
	" Set anObject as the receiver's genotype start position "
	
	^ self genotype start: (self validatePosition: anObject)
]

{ #category : #private }
BioRepeatSequence >> validatePosition: anObject [
	" Answer a <Number> matching aString "

	anObject isNumber 
		ifTrue: [ ^ anObject ].
	^ (anObject notNil and: [ anObject isAllDigits ])
		ifFalse: [ self nullValue negated ]
		ifTrue: [ anObject asNumber ]
]
