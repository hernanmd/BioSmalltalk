Class {
	#name : 'BioPhylipParserTest',
	#superclass : 'BioAbstractParserTest',
	#category : 'BioParsers-Tests',
	#package : 'BioParsers-Tests'
}

{ #category : 'as yet unclassified' }
BioPhylipParserTest >> testAmbiguousDNAAlphabetDetection [
	"Note: Ambiguous DNA codes like N, R, Y overlap with amino acid codes.
	 BioSmalltalk detects such sequences as protein alphabet by default.
	 This test verifies that sequences are still created correctly."
	| phylip aln seq |
	phylip := '2 10
Seq1 AACGTGGNNA
Seq2 CCGTATGGNN
'.
	aln := BioPhylipParser parseString: phylip.
	seq := aln sequences first.
	"Sequence is created and can be used regardless of alphabet detection"
	self assert: seq size equals: 10.
	self assert: (seq asString includesSubstring: 'NN')
]

{ #category : 'tests' }
BioPhylipParserTest >> testAsPhylipStringRelaxed [

	| phylip aln output |
	phylip := '3 10
Homo_sapiens AACGTGGCCA
Pan_troglodytes CCGTATGGCC
Gorilla GGCTTTGACC
'.
	aln := BioPhylipParser parseString: phylip.
	output := BioPhylipParser new asPhylipStringRelaxed: aln.
	self assert: (output includesSubstring: '3 10').
	self assert: (output includesSubstring: 'Homo_sapiens').
	self assert: (output includesSubstring: 'AACGTGGCCA')
]

{ #category : 'tests' }
BioPhylipParserTest >> testAutoDetectsInterleaved [

	| phylip aln |
	phylip := '2 20
S1 ATGCTAGCTA
S2 CCGCTAGCTA
GCTAGCTAGC
GCTAGCTAGC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 2.
	self assert: aln numberOfBases equals: 20
]

{ #category : 'tests' }
BioPhylipParserTest >> testAutoDetectsSequential [

	| phylip aln |
	"Sequential: taxon data on consecutive lines, continuation lines have no name"
	phylip := '2 20
S1 ATGC
GCTAGCTAGCTAGCTA
S2 CCGC
TAGCTAGCTAGCTAGC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 2.
	self assert: aln numberOfBases equals: 20
]

{ #category : 'tests' }
BioPhylipParserTest >> testClassicStrict5Taxa [

	| phylip aln |
	phylip := '5 13
Alpha     AACGTGGCCACAT
Beta      AAGGTCGCCACAC
Gamma     CAGTTCGCCACAA
Delta     GAGATTTCCGCCT
Epsilon   GAGATCTCCGCCC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 5.
	self assert: aln numberOfBases equals: 13.
	self assert: (aln sequenceNames includes: 'Alpha').
	self assert: (aln sequenceNames includes: 'Epsilon').
	self assert: aln sequences first asString equals: 'AACGTGGCCACAT'.
	self assert: aln sequences last asString equals: 'GAGATCTCCGCCC'
]

{ #category : 'as yet unclassified' }
BioPhylipParserTest >> testDNAAlphabetDetection [
	| phylip aln seq |
	phylip := '2 10
Seq1 AACGTGGCCA
Seq2 CCGTATGGCA
'.
	aln := BioPhylipParser parseString: phylip.
	seq := aln sequences first.
	self assert: (seq alphabet class name) equals: #BioIUPACUnambiguousDNA
]

{ #category : 'tests' }
BioPhylipParserTest >> testGapsAndAmbiguityCodes [

	| phylip aln |
	phylip := '3 10
Seq1 AAC-GG??TN
Seq2 CCN-AT???K
Seq3 GGRYY??-KM
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 3.
	self assert: aln numberOfBases equals: 10.
	self assert: aln sequences first asString equals: 'AAC-GG??TN'
]

{ #category : 'tests' }
BioPhylipParserTest >> testInterleavedWithBlankLines [

	| phylip aln |
	phylip := '3 40
Taxon1    ATGCTAGCTAGCTAGCTAGC
Taxon2    CCGCTAGCTAGCTAGCTAGC
Taxon3    GGGCTAGCTAGCTAGCTAGC

TAGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 3.
	self assert: aln numberOfBases equals: 40
]

{ #category : 'tests' }
BioPhylipParserTest >> testMinimalFile [

	| phylip aln |
	phylip := '2 1
A T
B G
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 2.
	self assert: aln numberOfBases equals: 1.
	self assert: aln sequences first asString equals: 'T'.
	self assert: aln sequences last asString equals: 'G'
]

{ #category : 'tests' }
BioPhylipParserTest >> testParserProperties [

	| phylip aln |
	phylip := '3 10
Taxon1 AACGTGGCCA
Taxon2 CCGTATGGCC
Taxon3 GGCTTTGACC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 3.
	self assert: aln numberOfBases equals: 10.
	self assert: (aln sequenceNames includes: 'Taxon1').
	self assert: (aln sequenceNames includes: 'Taxon3')
]

{ #category : 'as yet unclassified' }
BioPhylipParserTest >> testProteinAlphabetDetection [
	| phylip aln seq |
	phylip := '2 15
Human   MVKQLEARKRPEQQE
Mouse   MVKQLEARHRPEQQK
'.
	aln := BioPhylipParser parseString: phylip.
	seq := aln sequences first.
	self assert: (seq alphabet class name) equals: #BioIUPACProtein
]

{ #category : 'tests' }
BioPhylipParserTest >> testProteinSequences [

	| phylip aln |
	"Protein sequences with amino acid codes"
	phylip := '3 10
Human MVKQLEARKR
Mouse MVKQLEARHR
Chicken GGCTTTGACC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 3.
	self assert: aln numberOfBases equals: 10.
	self assert: (aln sequenceNames includes: 'Human')
]

{ #category : 'as yet unclassified' }
BioPhylipParserTest >> testRNAAlphabetDetection [
	| phylip aln seq |
	phylip := '2 10
Seq1 AACGUGGUUU
Seq2 CCGUAUGGAU
'.
	aln := BioPhylipParser parseString: phylip.
	seq := aln sequences first.
	self assert: (seq alphabet class name) equals: #BioIUPACUnambiguousRNA
]

{ #category : 'tests' }
BioPhylipParserTest >> testRelaxedInterleaved [

	| phylip aln |
	phylip := '3 40
Homo_sapiens ATGCTAGCTAGCTAGCTAGC
Pan_troglodytes CCGCTAGCTAGCTAGCTAGC
Gorilla_gorilla GGGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 3.
	self assert: aln numberOfBases equals: 40.
	self assert: (aln sequenceNames includes: 'Homo_sapiens').
	self assert: (aln sequenceNames includes: 'Gorilla_gorilla')
]

{ #category : 'tests' }
BioPhylipParserTest >> testRelaxedSequential [

	| phylip aln |
	phylip := '4 20
Homo_sapiens AACGTGGCCACATACGTGGC
Pan_troglodytes AAGGTCGCCACACAAGGTCC
Gorilla_gorilla CAGTTCGCCACAACAGTTCC
Pongo_abelii GAGATTTCCGCCTGAGATTT
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 4.
	self assert: aln numberOfBases equals: 20.
	self assert: (aln sequenceNames includes: 'Homo_sapiens').
	self assert: (aln sequenceNames includes: 'Pongo_abelii')
]

{ #category : 'tests' }
BioPhylipParserTest >> testRoundTripStrict [

	| phylip aln output |
	phylip := '3 10
Taxon1   AACGTGGCCA
Taxon2   CCGTATGGCC
Taxon3   GGCTTTGACC
'.
	aln := BioPhylipParser parseString: phylip.
	output := BioPhylipParser new asPhylipStringStrict: aln.
	self assert: (output includesSubstring: '3 10').
	self assert: (output includesSubstring: 'Taxon1').
	self assert: (output includesSubstring: 'AACGTGGCCA')
]

{ #category : 'tests' }
BioPhylipParserTest >> testSequentialWithWrapping [

	| phylip aln |
	phylip := '3 40
Taxon1    ATGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
Taxon2    CCGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
Taxon3    GGGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 3.
	self assert: aln numberOfBases equals: 40.
	self assert: aln sequences first asString size equals: 40
]

{ #category : 'tests' }
BioPhylipParserTest >> testSpacesInSequences [

	| phylip aln |
	phylip := '2 10
Seq1 AACGTGGCCA
Seq2 CCGTATGGCC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 2.
	self assert: aln numberOfBases equals: 10.
	self assert: aln sequences first asString equals: 'AACGTGGCCA'
]

{ #category : 'tests' }
BioPhylipParserTest >> testStrictInterleaved [

	| phylip aln |
	phylip := '3 40
Taxon1    ATGCTAGCTAGCTAGCTAGC
Taxon2    CCGCTAGCTAGCTAGCTAGC
Taxon3    GGGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
TAGCTAGCTAGCTAGCTAGC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 3.
	self assert: aln numberOfBases equals: 40.
	self
		assert: aln sequenceNames asArray
		equals: #( 'Taxon1' 'Taxon2' 'Taxon3' ).
	self
		assert: aln sequences first asString
		equals: 'ATGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGC'
]

{ #category : 'tests' }
BioPhylipParserTest >> testStrictSequential [

	| phylip aln |
	phylip := '5 13
Alpha     AACGTGGCCACAT
Beta      AAGGTCGCCACAC
Gamma     CAGTTCGCCACAA
Delta     GAGATTTCCGCCT
Epsilon   GAGATCTCCGCCC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 5.
	self assert: aln numberOfBases equals: 13.
	self assert: (aln sequenceNames includes: 'Alpha').
	self assert: (aln sequenceNames includes: 'Epsilon').
	self assert: aln sequences first asString equals: 'AACGTGGCCACAT'
]

{ #category : 'tests' }
BioPhylipParserTest >> testThreeBlockInterleaved [

	| phylip aln |
	phylip := '2 60
S1 ATGCTAGCTAGCTAGCTAGCTAGCTAGCTA
S2 ATGCTAGCTAGCTAGCTAGCTAGCTAGCTA
GCTAGCTAGCTAGCTAGCTAGCTAGCTAGC
GCTAGCTAGCTAGCTAGCTAGCTAGCTAGC
'.
	aln := BioPhylipParser parseString: phylip.
	self assert: aln size equals: 2.
	self assert: aln numberOfBases equals: 60.
	self assert: aln sequences first asString size equals: 60
]

{ #category : 'tests' }
BioPhylipParserTest >> testValidatorRejectsWrongSeqLength [

	| phylip |
	phylip := '2 10
Seq1 AACGTG
Seq2 CCGTAT
'.
	self should: [ BioPhylipParser parseString: phylip ] raise: Error
]

{ #category : 'tests' }
BioPhylipParserTest >> testValidatorRejectsWrongTaxaCount [

	| phylip |
	phylip := '3 10
Seq1 AACGTGGCCA
Seq2 CCGTATGGCC
'.
	self should: [ BioPhylipParser parseString: phylip ] raise: Error
]
