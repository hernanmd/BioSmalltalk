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

{ #category : #testing }
BioFastaMultiRecordTest >> testAddFastaRecord [

	| oldFastaCollectionSize |
	
	self fastaCollection: (BioParser parseMultiFasta: self multiFastaSeq).
	
	oldFastaCollectionSize := self fastaCollection size.
	self fastaCollection addFastaRecord:
			(BioFastaRecord 
					named: 'Added Fasta Record 1'
					sequence: 'ACGT'
					alphabet: BioIUPACUnambiguousDNA).
	self assert: self fastaCollection size = (oldFastaCollectionSize + 1).
]

{ #category : #testing }
BioFastaMultiRecordTest >> testIncludesFastaRecord [

	| fastaRecord |
	
	fastaRecord := BioFastaRecord 
					named: 'Added Fasta Record 1'
					sequence: 'ACGT'
					alphabet: BioIUPACUnambiguousDNA.
	self fastaCollection: (BioParser parseMultiFasta: self multiFastaSeq).
	
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
	self fastaCollection: (BioParser parseMultiFasta: self multiFastaSeq).
	
	self deny: (self fastaCollection includesName: 'Added Fasta Record 1').
	self fastaCollection addFastaRecord: fastaRecord.
	self assert: (self fastaCollection includesName: 'Added Fasta Record 1').
]

{ #category : #testing }
BioFastaMultiRecordTest >> testReverseComplement [

	| newFastaCollection firstSeq sndSeq |
	
	self fastaCollection: (BioParser parseMultiFasta: self multiFastaSeq).
	self fastaCollection alphabet: BioIUPACAmbiguousDNA.
	firstSeq := self fastaCollection sequences first.
	sndSeq := self fastaCollection sequences second.
	newFastaCollection := self fastaCollection reverseComplement.

	self assert: (newFastaCollection isKindOf: BioFastaMultiRecord).	
	self deny: newFastaCollection isEmpty.
	self assert: firstSeq reverseComplement asString = newFastaCollection sequences first asString.
	self assert: sndSeq reverseComplement asString = newFastaCollection sequences second asString.
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
