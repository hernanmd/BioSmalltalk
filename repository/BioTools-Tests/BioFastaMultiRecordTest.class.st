Class {
	#name : #BioFastaMultiRecordTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'fastaCollection'
	],
	#category : #'BioTools-Tests-Core'
}

{ #category : #accessing }
BioFastaMultiRecordTest >> fastaCollection [
	^ fastaCollection
]

{ #category : #accessing }
BioFastaMultiRecordTest >> fastaCollection: aCollection [

	fastaCollection := aCollection
]

{ #category : #accessing }
BioFastaMultiRecordTest >> multiFastaSeq [
	" sequence2 is reverse complement of sequence1 "

	^ '>sequence1
ACGGGAGGACGGGAAAATTACTACGGCATTAGC
>sequence2
GCTAATGCCGTAGTAATTTTCCCGTCCTCCCGT
'

]

{ #category : #running }
BioFastaMultiRecordTest >> setUp [ 

	super setUp.
	self fastaCollection: (BioParser parseMultiFasta: self multiFastaSeq).
]

{ #category : #testing }
BioFastaMultiRecordTest >> testAddFastaRecord [
	| oldFastaCollectionSize |
	oldFastaCollectionSize := self fastaCollection size.
	self fastaCollection
		addFastaRecord:
			(BioFastaRecord
				named: 'Added Fasta Record 1'
				sequence: 'ACGT'
				alphabet: BioIUPACUnambiguousDNA).
	self
		assert: self fastaCollection size
		equals: oldFastaCollectionSize + 1
]

{ #category : #test }
BioFastaMultiRecordTest >> testAsString [

	self assert: (self fastaCollection asString isKindOf: String).
	self deny: self fastaCollection asString isEmpty.
]

{ #category : #test }
BioFastaMultiRecordTest >> testContents [

	self assert: self fastaCollection contents equals: self fastaCollection.
]

{ #category : #test }
BioFastaMultiRecordTest >> testGcContent [

	self assert: self fastaCollection gcContent notEmpty.
	self assert: (self fastaCollection gcContent isKindOf: Dictionary).
]

{ #category : #test }
BioFastaMultiRecordTest >> testHasSameLength [

	self assert: self fastaCollection hasSameLength.
]

{ #category : #testing }
BioFastaMultiRecordTest >> testIncludesFastaRecord [

	| fastaRecord |
	
	fastaRecord := BioFastaRecord 
					named: 'Added Fasta Record 1'
					sequence: 'ACGT'
					alphabet: BioIUPACUnambiguousDNA.
	
	self deny: (self fastaCollection includes: fastaRecord).
	self fastaCollection addFastaRecord: fastaRecord.
	self assert: (self fastaCollection includes: fastaRecord).
]

{ #category : #testing }
BioFastaMultiRecordTest >> testIncludesName [

	| fastaRecord |
	
	fastaRecord := BioFastaRecord 
					named: 'Added Fasta Record 1'
					sequence: 'ACGT'
					alphabet: BioIUPACUnambiguousDNA.
	
	self deny: (self fastaCollection includesName: 'Added Fasta Record 1').
	self fastaCollection addFastaRecord: fastaRecord.
	self assert: (self fastaCollection includesName: 'Added Fasta Record 1').
]

{ #category : #test }
BioFastaMultiRecordTest >> testIsEmpty [

	self deny: self fastaCollection isEmpty.

]

{ #category : #testing }
BioFastaMultiRecordTest >> testReverseComplement [

	| newFastaCollection firstSeq sndSeq |

	self fastaCollection alphabet: BioIUPACAmbiguousDNA.
	firstSeq := self fastaCollection sequences first.
	sndSeq := self fastaCollection sequences second.
	newFastaCollection := self fastaCollection reverseComplement.
	self assert: (newFastaCollection isKindOf: BioFastaMultiRecord).
	self deny: newFastaCollection isEmpty.
	self
		assert: firstSeq reverseComplement asString
		equals: newFastaCollection sequences first asString.
	self
		assert: sndSeq reverseComplement asString
		equals: newFastaCollection sequences second asString
]

{ #category : #test }
BioFastaMultiRecordTest >> testSequenceNames [

	self assert: self fastaCollection sequenceNames notEmpty.
	self assert: (self fastaCollection sequenceNames allSatisfy: #isString).
	self assert: (self fastaCollection sequenceNames allSatisfy: #notEmpty).
	self assert: self fastaCollection sequenceNames first equals: 'sequence1'.
]

{ #category : #test }
BioFastaMultiRecordTest >> testSequenceStrings [

	self assert: self fastaCollection sequenceStrings notEmpty.
	self assert: (self fastaCollection sequenceStrings allSatisfy: #isString).
	self assert: (self fastaCollection sequenceStrings allSatisfy: #notEmpty).
]

{ #category : #test }
BioFastaMultiRecordTest >> testSequences [

	self assert: self fastaCollection sequences notEmpty.
	self assert: (self fastaCollection sequences allSatisfy: #isBioSequence).
]

{ #category : #test }
BioFastaMultiRecordTest >> testSize [

	self assert: self fastaCollection size equals: 2.
]

{ #category : #testing }
BioFastaMultiRecordTest >> testSort [

	| newFastaCollection |
	
	self fastaCollection: (BioParser parseMultiFasta: self unsortedMultiFastaSeq).
	newFastaCollection := self fastaCollection sort.
	
	self deny: self fastaCollection isSorted.
	self assert: (newFastaCollection isKindOf: BioFastaMultiRecord).
	self deny: newFastaCollection isEmpty.
	self assert: newFastaCollection isSorted.
]

{ #category : #accessing }
BioFastaMultiRecordTest >> unsortedMultiFastaSeq [
	" From http://quma.cdb.riken.jp/help/multiFastaHelp.html "

	^ '>sequence3
ACTCCCCGTGCGCGCCCGGCCCGTAGCGTCCTCGTCGCCGCCCCTCGTCTCGCAGCCGCAGCCCGCGTGG
ACGCTCTCGCCTGAGCGCCGCGGACTAGCCCGGGTGGCC
>sequence2
CAGTCCGGCAGCGCCGGGGTTAAGCGGCCCAAGTAAACGTAGCGCAGCGATCGGCGCCGGAGATTCGCGA
ACCCGACACTCCGCGCCGCCCGCCGGCCAGGACCCGCGGCGCGATCGCGGCGCCGCGCTACAGCCAGCCT
CACTGGCGCGCGGGCGAGCGCACGGGCGCTC
>sequence1
CACGACAGGCCCGCTGAGGCTTGTGCCAGACCTTGGAAACCTCAGGTATATACCTTTCCAGACGCGGGAT
CTCCCCTCCCC
>sequence4
CAGCAGACATCTGAATGAAGAAGAGGGTGCCAGCGGGTATGAGGAGTGCATTATCGTTAATGGGAACTTC
AGTGACCAGTCCTCAGACACGAAGGATGCTCCCTCACCCCCAGTCTTGGAGGCAATCTGCACAGAGCCAG
TCTGCACACC'
]
