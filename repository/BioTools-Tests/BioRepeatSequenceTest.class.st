Class {
	#name : 'BioRepeatSequenceTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests',
	#package : 'BioTools-Tests'
}

{ #category : 'tests' }
BioRepeatSequenceTest >> testAlleleSize [

	| str |
	str := BioSTRSequence new
		       motif: 'TATC';
		       repeats: 10.
	self assert: str alleleSize equals: 40
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testAsGFFRow [
	"Test GFF3 format output"

	| str gff |
	str := BioSTRSequence new
		       name: 'D13S317';
		       motif: 'TATC';
		       repeats: 10;
		       chromosome: '13';
		       markerCode: 'D13S317';
		       start: 82367542;
		       end: 82367581;
		       yourself.

	gff := str asGFFRow.

	"Should contain tab-separated fields"
	self assert: (gff includesSubstring: '13').
	self assert: (gff includesSubstring: 'tandem_repeat').
	self assert: (gff includesSubstring: '82367542').
	self assert: (gff includesSubstring: '82367581').
	self assert: (gff includesSubstring: 'motif=TATC').
	self assert: (gff includesSubstring: 'repeats=10').
	self assert: (gff includesSubstring: 'D13S317')
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testAsGFFRowFormat [
	"Test that GFF row has exactly 9 tab-separated fields"

	| str gff fields |
	str := BioSTRSequence new
		       markerCode: 'TEST';
		       motif: 'AT';
		       repeats: 5;
		       chromosome: 'chr1';
		       start: 100;
		       end: 110;
		       yourself.

	gff := str asGFFRow.
	fields := gff findTokens: Character tab.

	"GFF3 has 9 required fields"
	self assert: fields size equals: 9.
	self assert: fields first equals: 'chr1'.
	self assert: fields third equals: 'tandem_repeat'.
	self assert: fields fourth equals: '100'.
	self assert: fields fifth equals: '110'
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testAsGFFRowReverseStrand [
	"Test GFF3 format output for reverse strand"

	| str gff |
	str := BioSTRSequence new
		       markerCode: 'D7S820';
		       motif: 'GAT';
		       repeats: 12;
		       chromosome: '7';
		       start: 1000;
		       end: 1036;
		       strand: -1;
		       yourself.

	gff := str asGFFRow.

	"Should indicate reverse strand with -"
	self assert: (gff includesSubstring: '7').
	self assert: (gff includesSubstring: '-').
	self assert: (gff includesSubstring: 'motif=GAT')
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testAsGenBankFeature [
	"Test GenBank feature format output"

	| str feature |
	str := BioSTRSequence new
		       markerCode: 'D13S317';
		       motif: 'TATC';
		       repeats: 10;
		       start: 82367542;
		       end: 82367581;
		       yourself.

	feature := str asGenBankFeature.

	"Should contain GenBank feature elements"
	self assert: (feature includesSubstring: 'repeat_region').
	self assert: (feature includesSubstring: '82367542').
	self assert: (feature includesSubstring: '82367581').
	self assert: (feature includesSubstring: 'rpt_type=tandem').
	self assert: (feature includesSubstring: 'rpt_unit_seq').
	self assert: (feature includesSubstring: 'TATC')
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testAsGenBankFeatureFormatting [
	"Test GenBank feature has proper formatting with tabs/lines"

	| str feature |
	str := BioSTRSequence new
		       markerCode: 'VWA';
		       motif: 'ATAG';
		       repeats: 8;
		       start: 100;
		       end: 132;
		       yourself.

	feature := str asGenBankFeature.

	"Should have the feature type and location"
	self assert: (feature beginsWith: 'repeat_region').
	self assert: (feature includesSubstring: '100').
	self assert: (feature includesSubstring: '132')
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testAsString [

	| str |
	str := BioSTRSequence new
		       motif: 'AT';
		       repeats: 5.
	self assert: str asString equals: 'ATATATATAT'
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testChromosome [

	| str |
	str := BioSTRSequence new chromosome: '13'.
	self assert: str chromosome equals: '13'.
	self assert: str isForwardStrand
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testExpectedPCRSize [
	"Test expectedPCRSize calculation"

	| str |
	str := BioSTRSequence new
		       motif: 'TATC';
		       repeats: 10;
		       yourself.

	"Without flanks: 4 bp motif * 10 repeats = 40 bp"
	self assert: str alleleSize equals: 40.
	self assert: str expectedPCRSize equals: 40.

	"With flanking regions"
	str flankingRegionLeft: 'ACGT'.
	str flankingRegionRight: 'TGCA'.
	"40 + 4 + 4 = 48 bp"
	self assert: str expectedPCRSize equals: 48
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testExpectedPCRSizeWithFlanks [
	"Test expectedPCRSize with various flanking region combinations"

	| str |
	str := BioSTRSequence new
		       motif: 'AT';
		       repeats: 15;
		       flankingRegionLeft: 'GGCGGC';
		       flankingRegionRight: 'AATT';
		       yourself.

	"2 * 15 = 30 bp allele, + 6 + 4 = 40 bp PCR product"
	self assert: str alleleSize equals: 30.
	self assert: str leftFlankSize equals: 6.
	self assert: str rightFlankSize equals: 4.
	self assert: str expectedPCRSize equals: 40
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testFlankingRegions [

	| str |
	str := BioSTRSequence new
		       motif: 'AT';
		       repeats: 3;
		       flankingRegionLeft: 'GC';
		       flankingRegionRight: 'TA';
		       yourself.
	self assert: str sequenceWithFlanks equals: 'GCATATATTA'
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testIsDiNucleotide [

	| str |
	str := BioSTRSequence new
		       motif: 'AT';
		       repeats: 10.
	self assert: str isDiNucleotide
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testIsTetraNucleotide [

	| str |
	str := BioSTRSequence new
		       motif: 'TATC';
		       repeats: 5.
	self assert: str isTetraNucleotide.
	self deny: str isTriNucleotide
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testIsTriNucleotide [

	| str |
	str := BioSTRSequence new
		       motif: 'ATG';
		       repeats: 5.
	self assert: str isTriNucleotide
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testMarkerCode [

	| str |
	str := BioSTRSequence new markerCode: 'D13S317'.
	self assert: str markerCode equals: 'D13S317'.
	self assert: str asAlleleString equals: 'D13S317=0'
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testMotifSize [

	| str |
	str := BioSTRSequence new
		       motif: 'TATC';
		       repeats: 5.
	self assert: str motifSize equals: 4
]

{ #category : 'tests' }
BioRepeatSequenceTest >> testPerfectRepeat [
    | str |
    str := BioSTRSequence new motif: 'AT'; repeats: 5.
    str sequence: 'ATATATATAT'.
    self assert: str isPerfectRepeat
]
