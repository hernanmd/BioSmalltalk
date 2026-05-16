"
Test class for BioAlignment. Validates multiple sequence alignment creation, manipulation, and output formatting.
"
Class {
	#name : 'BioAlignmentTest',
	#superclass : 'BioAbstractTest',
	#instVars : [
		'align'
	],
	#category : 'BioTools-Tests-Align',
	#package : 'BioTools-Tests',
	#tag : 'Align'
}

{ #category : 'accessing' }
BioAlignmentTest >> alphaSequence [

	^ BioSequence 
		newNamed: 'Alpha' 
		sequence: 'ACTGCTAGCTAG'

]

{ #category : 'accessing' }
BioAlignmentTest >> betaSequence [

	^ BioSequence 
		newNamed: 'Beta' 
		sequence: 'ACT-CTAGCTAG'

]

{ #category : 'accessing' }
BioAlignmentTest >> gammaSequence [

	^ BioSequence 
		newNamed: 'Gamma' 
		sequence: 'ACTGCTAGATAG'


]

{ #category : 'accessing' }
BioAlignmentTest >> sampleAlignment01 [

	align := BioAlignment new.
	align 
		addSequence: self alphaSequence;
		addSequence: self betaSequence;
		addSequence: self gammaSequence.
	^ align

]

{ #category : 'accessing' }
BioAlignmentTest >> sampleAlignment02 [

	align := BioAlignment new.
	align 
		addSequence: self alphaSequence;
		addSequence: self betaSequence;
		addSequence: self gammaSequence;
		addSequence: (BioSequence newNamed: 'Delta' sequence: 'ACTGCTTGCTAG');
		addSequence: (BioSequence newNamed: 'Epsilon' sequence: 'ACTGCTTGATAG').		
	^ align

]

{ #category : 'accessing' }
BioAlignmentTest >> sampleAlignment03 [

	align := BioAlignment new.
	align 
		addSequence: 'ACTGCTAGCTAG';
		addSequence: 'ACT-CTAGCTAG';
		addSequence: 'ACTGCTAGATAG';
		addSequence: 'ACTGCTTGCTAG';
		addSequence: 'ACTGCTTGATAG'.		
	^ align

]

{ #category : 'accessing' }
BioAlignmentTest >> sampleAlignment04 [

	align := BioAlignment new.
	align 
		addSequence: 'ACTGCTAGCTAG';
		addSequence: 'ACT-CTAGCTAG';
		addSequence: 'ACTGGTANATGG';
		addSequence: 'ACTGATTGCTGG';
		addSequence: 'ACTGCTTGATTG'.		
	^ align

]

{ #category : 'tests' }
BioAlignmentTest >> testAnyOne [

	align := self sampleAlignment01.
	self assert: (align anyOne isKindOf: BioSequence).

]

{ #category : 'tests' }
BioAlignmentTest >> testAt [

	| alignRegion |
	
	align := self sampleAlignment01.
	self assert: ((align at: 1) isKindOf: BioSequence).
	self assert: (align at: 1) equals: self alphaSequence.
	
	alignRegion := align at: (1 to: 3).
	self assert: (alignRegion isKindOf: Collection).
	self assert: alignRegion size equals: 3.
	self assert: (alignRegion bioHasEqualElements: { self alphaSequence . self betaSequence . self gammaSequence }).
	
	self should: [ align at: 4 ] raise: BioException
]

{ #category : 'tests' }
BioAlignmentTest >> testAtAccession [

	| acc seqWithAccession |
	
	align := self sampleAlignment01.
	acc := BioAccession newNamed: 'ABC123.1'.
	seqWithAccession := align first sequenceRecord.
	seqWithAccession name: acc.
	self assert: ((align atAccession: acc) isKindOf: BioSequence).
	self assert: (align atAccession: acc) equals: align first.
]

{ #category : 'tests' }
BioAlignmentTest >> testAtAlignment [

	align := self sampleAlignment01.
	self assert: ((align atAlignment: 1) isKindOf: BioSequence).
	self assert: (align atAlignment: 1) equals: self alphaSequence.
	
	self should: [ align atAlignment: 4 ] raise: BioException
]

{ #category : 'tests' }
BioAlignmentTest >> testAtColumn [
	align := self sampleAlignment01.
	self assert: ((align atColumn: 2) isKindOf: BioSequence).
	self assert: (align atColumn: 4) equals: 'G-G' asSequence.
	self
		should: [ align atColumn: 20000 ]
		raise: BioErrorSpecificationObject.
	self should: [ align atColumn: 0 ] raise: BioErrorSpecificationObject
]

{ #category : 'tests' }
BioAlignmentTest >> testBeReference [

	align := self sampleAlignment01.
	self deny: align isReference.
	align beReference.
	self assert: align isReference.
]

{ #category : 'tests' }
BioAlignmentTest >> testConsensus [

	align := self sampleAlignment01.
	self assert: align consensus asString equals: 'ACTGCTAGCTAG'.
	align := self sampleAlignment04.
	self assert: align consensus asString equals: 'ACTGCTAGCTAG'

]

{ #category : 'tests' }
BioAlignmentTest >> testCopyFrom [
	| set |
	align := self sampleAlignment01.
	set := align copyFrom: 2 to: 3.
	self assert: (set isKindOf: Collection).
	self assert: set size equals: 2.
	self assert: (set allSatisfy: [ :elem | elem isKindOf: BioSequence ]).
	self assert: set first name equals: 'Beta'.
	self assert: set second name equals: 'Gamma'.
	align := self sampleAlignment02.
	set := align copyFrom: 1 to: 4.
	self assert: set size equals: 4.
	self assert: (set allSatisfy: [ :elem | elem isKindOf: BioSequence ]).
	self should: [ align copyFrom: 5 to: 3 ] raise: BioException.
	self should: [ align copyFrom: 0 to: 2 ] raise: Error.
	self should: [ align copyFrom: -1 to: 1 ] raise: Error
]

{ #category : 'tests' }
BioAlignmentTest >> testFirst [

	align := self sampleAlignment01.
	self assert: (align first isKindOf: BioSequence).
	self assert: align first equals: self alphaSequence
]

{ #category : 'tests' }
BioAlignmentTest >> testIsReference [

	align := self sampleAlignment01.
	self deny: align isReference.
	align isReference: true.
	self assert: align isReference.
]

{ #category : 'tests' }
BioAlignmentTest >> testLast [

	align := self sampleAlignment01.
	self assert: (align last isKindOf: BioSequence).
	self assert: align last equals: self gammaSequence
]

{ #category : 'tests' }
BioAlignmentTest >> testNumberOfBases [

	align := self sampleAlignment01.
	self assert: (align numberOfBases isKindOf: Number).
	self assert: align numberOfBases equals: self alphaSequence size
]

{ #category : 'tests' }
BioAlignmentTest >> testSequenceAsFastaString [
	align := self sampleAlignment01.
	self
		assert: align asMultiFastaString
		equals:
			'>Alpha
ACTGCTAGCTAG
>Beta
ACT-CTAGCTAG
>Gamma
ACTGCTAGATAG
'
]

{ #category : 'tests' }
BioAlignmentTest >> testSequenceAsPhylipString [
	align := self sampleAlignment01.
	self
		assert: align asPhylipString
		equals:
			'3 12
Alpha     ACTGCTAGCTAG
Beta      ACT-CTAGCTAG
Gamma     ACTGCTAGATAG
'
]

{ #category : 'tests' }
BioAlignmentTest >> testSequenceNames [

	align := self sampleAlignment01.
	self
		assert: align sequenceNames asArray
		equals: #('Alpha' 'Beta' 'Gamma').

]

{ #category : 'tests' }
BioAlignmentTest >> testSequenceStrings [

	align := self sampleAlignment01.
	self
		assert: align sequenceStrings asArray
		equals: #('ACTGCTAGCTAG' 'ACT-CTAGCTAG' 'ACTGCTAGATAG')
]

{ #category : 'tests' }
BioAlignmentTest >> testSequences [

	align := self sampleAlignment01.	
	self assert: (align sequences isKindOf: Collection).
	self deny: align sequences isEmpty.

]

{ #category : 'tests' }
BioAlignmentTest >> testSize [

	align := self sampleAlignment01.
	self assert: align size equals: 3.

]
