"
Test class for BioGenomicRanges and BioGenomicRange. Validates genomic range construction, strand handling, and filtering operations.
"
Class {
	#name : 'BioGenomicRangesTest',
	#superclass : 'TestCase',
	#category : 'BioTools-Tests-Genomic-Ranges',
	#package : 'BioTools-Tests',
	#tag : 'Genomic-Ranges'
}

{ #category : 'accessing' }
BioGenomicRangesTest >> sampleGenomicRanges01 [
	^ BioGenomicRanges
		seqnames: #('chr1' 'chr1' 'chr2')
		starts: #(1 10 5)
		ends: #(5 20 8)
		strands: #('+' '-' '*')
		metadata: Dictionary new
]

{ #category : 'tests' }
BioGenomicRangesTest >> testAddMetadata [
	| gr |
	gr := self sampleGenomicRanges01.
	gr addMetadata: #(10 20 30) at: #score.
	self assert: ((gr metadata at: #score) at: 2) equals: 20
]

{ #category : 'tests' }
BioGenomicRangesTest >> testAsBEDRoundTrip [

	| gr out parsed |
	gr := BioGenomicRanges
		      seqnames: #( 'chr1' )
		      starts: #( 1 )
		      ends: #( 10 )
		      strands: #( '+' )
		      metadata: (Dictionary new
				       at: #name put: #( 'n' );
				       at: #score put: #( '1' );
				       yourself).
	out := gr asBEDString.
	parsed := BioGenomicRanges fromBED: out.
	self assert: parsed size equals: 1.
	self assert: (parsed start at: 1) equals: 1.
	self assert: (parsed end at: 1) equals: 10
]

{ #category : 'tests' }
BioGenomicRangesTest >> testAsDataFrame [
	| df |
	df := self sampleGenomicRanges01 asDataFrame.
	self assert: (df at: #seqnames) size equals: 3

]

{ #category : 'tests' }
BioGenomicRangesTest >> testAsGFFRoundTrip [

	| gr out parsed |
	gr := BioGenomicRanges
		      seqnames: #( 'chr1' )
		      starts: #( 5 )
		      ends: #( 20 )
		      strands: #( '+' )
		      metadata: Dictionary new.
	out := gr asGFFString.
	parsed := BioGenomicRanges fromGFF: out.
	self assert: parsed size equals: 1.
	self assert: parsed start first equals: 5
]

{ #category : 'tests' }
BioGenomicRangesTest >> testAtReturnsSingleRange [

	| one |
	one := self sampleGenomicRanges01 first.
	self assert: one start equals: 1.
	self assert: one end equals: 5
]

{ #category : 'tests' }
BioGenomicRangesTest >> testBioStrandFrom [
	self assert: (BioStrand from: '+') isPlus.
	self assert: (BioStrand from: '-') isMinus.
	self assert: (BioStrand from: '*') isUnknown
]

{ #category : 'tests' }
BioGenomicRangesTest >> testCopyWithSeqnames [
	| gr cp |
	gr := self sampleGenomicRanges01.
	cp := gr copyWithSeqnames: #('a' 'b' 'c').
	self assert: (cp seqnames at: 3) equals: 'c'
]

{ #category : 'tests' }
BioGenomicRangesTest >> testCountOverlaps [

	| a b counts |
	a := BioGenomicRanges
		     seqnames: #( 'chr1' 'chr1' )
		     starts: #( 1 20 )
		     ends: #( 10 30 )
		     strands: #( '+' '+' )
		     metadata: Dictionary new.
	b := BioGenomicRanges
		     seqnames: #( 'chr1' 'chr1' )
		     starts: #( 5 25 )
		     ends: #( 6 28 )
		     strands: #( '+' '+' )
		     metadata: Dictionary new.
	counts := a countOverlaps: b.
	self assert: counts first equals: 1.
	self assert: (counts at: 2) equals: 1
]

{ #category : 'tests' }
BioGenomicRangesTest >> testCreateFromLiteral [
	| gr |
	gr := self sampleGenomicRanges01.
	self assert: gr size equals: 3.
	self assert: (gr seqnames at: 1) equals: 'chr1'.
	self assert: (gr start at: 2) equals: 10
]

{ #category : 'tests' }
BioGenomicRangesTest >> testDisjoinAliasReduceV1 [

	| gr dj |
	gr := BioGenomicRanges
		      seqnames: #( 'chr1' 'chr1' )
		      starts: #( 1 3 )
		      ends: #( 5 7 )
		      strands: #( '+' '+' )
		      metadata: Dictionary new.
	dj := gr disjoin.
	self assert: dj size equals: 1
]

{ #category : 'tests' }
BioGenomicRangesTest >> testEmptyRanges [
	| gr |
	gr := BioGenomicRanges seqnames: #() starts: #() ends: #() strands: #() metadata: Dictionary new.
	self assert: gr isEmpty

]

{ #category : 'tests' }
BioGenomicRangesTest >> testExampleGRangesFromBioconductorPaper [

	| gr |
	gr := BioGenomicRanges
		      seqnames: #( 'chr1' 'chr2' 'chr1' )
		      starts: #( 1 101 1001 )
		      ends: #( 100 200 1100 )
		      strands: #( '+' '-' '+' )
		      metadata: (Dictionary new
				       at: #score put: #( 5 3 7 );
				       yourself).
	self assert: gr size equals: 3.
	self assert: gr width first equals: 100.
	self assert: (gr seqnames at: 3) equals: 'chr1'
]

{ #category : 'tests' }
BioGenomicRangesTest >> testFindOverlapsDifferentSeqname [
	| a b |
	a := BioGenomicRanges seqnames: #('chr1') starts: #(1) ends: #(10) strands: #('+') metadata: Dictionary new.
	b := BioGenomicRanges seqnames: #('chr2') starts: #(5) ends: #(15) strands: #('+') metadata: Dictionary new.
	self assert: (a findOverlaps: b) isEmpty
]

{ #category : 'tests' }
BioGenomicRangesTest >> testFindOverlapsIgnoreStrand [
	| a b |
	a := BioGenomicRanges seqnames: #('chr1') starts: #(1) ends: #(10) strands: #('+') metadata: Dictionary new.
	b := BioGenomicRanges seqnames: #('chr1') starts: #(5) ends: #(15) strands: #('-') metadata: Dictionary new.
	a ignoreStrand.
	self assert: (a findOverlaps: b) size equals: 1
]

{ #category : 'tests' }
BioGenomicRangesTest >> testFindOverlapsSimple [
	| a b hits |
	a := BioGenomicRanges seqnames: #('chr1') starts: #(1) ends: #(10) strands: #('+') metadata: Dictionary new.
	b := BioGenomicRanges seqnames: #('chr1') starts: #(5) ends: #(15) strands: #('+') metadata: Dictionary new.
	hits := a findOverlaps: b.
	self assert: hits size equals: 1.
	self assert: hits first key equals: 1
]

{ #category : 'tests' }
BioGenomicRangesTest >> testFindOverlapsStrandSensitive [
	| a b |
	a := BioGenomicRanges seqnames: #('chr1') starts: #(1) ends: #(10) strands: #('+') metadata: Dictionary new.
	b := BioGenomicRanges seqnames: #('chr1') starts: #(5) ends: #(15) strands: #('-') metadata: Dictionary new.
	self assert: (a findOverlaps: b) isEmpty
]

{ #category : 'tests' }
BioGenomicRangesTest >> testFlipStrand [

	| gr |
	gr := self sampleGenomicRanges01 copy.
	gr flipStrand.
	self assert: gr strand first symbol equals: #-.
	self assert: (gr strand at: 2) symbol equals: #+
]

{ #category : 'tests' }
BioGenomicRangesTest >> testFromBED [

	| bed gr |
	bed := 'chr1	0	10	x	5	+'.
	gr := BioGenomicRanges fromBED: bed.
	self assert: gr size equals: 1.
	self assert: (gr start at: 1) equals: 1.
	self assert: gr end first equals: 10
]

{ #category : 'tests' }
BioGenomicRangesTest >> testFromGFF [

	| gff gr |
	gff := 'chr1	src	gene	5	20	.	+	.	ID=g1'.
	gr := BioGenomicRanges fromGFF: gff.
	self assert: gr size equals: 1.
	self assert: gr start first equals: 5
]

{ #category : 'tests' }
BioGenomicRangesTest >> testIRangesRejectNegativeWidth [

	self should: [ BioIRanges starts: #( 5 ) ends: #( 4 ) ] raise: Error
]

{ #category : 'tests' }
BioGenomicRangesTest >> testIRangesWidth [

	| ir |
	ir := BioIRanges starts: #( 2 10 ) ends: #( 4 12 ).
	self assert: ir width first equals: 3.
	self assert: (ir width at: 2) equals: 3
]

{ #category : 'tests' }
BioGenomicRangesTest >> testMetadataCanContainObjects [

	| gr obj |
	obj := Object new.
	gr := self sampleGenomicRanges01.
	gr
		addMetadata: {
				obj.
				obj.
				obj }
		at: #sequence.
	self assert: (gr metadata at: #sequence) first identicalTo: obj
]

{ #category : 'tests' }
BioGenomicRangesTest >> testOverlapWith [

	| a b c |
	a := BioGenomicRanges
		     seqnames: #( 'chr1' 'chr1' )
		     starts: #( 1 50 )
		     ends: #( 10 60 )
		     strands: #( '+' '+' )
		     metadata: Dictionary new.
	b := BioGenomicRanges
		     seqnames: #( 'chr1' )
		     starts: #( 5 )
		     ends: #( 15 )
		     strands: #( '+' )
		     metadata: Dictionary new.
	c := a overlapWith: b.
	self assert: c size equals: 1.
	self assert: c start first equals: 1
]

{ #category : 'tests' }
BioGenomicRangesTest >> testReduceKeepsStrandSeparate [

	| gr red |
	gr := BioGenomicRanges
		      seqnames: #( 'chr1' 'chr1' )
		      starts: #( 1 2 )
		      ends: #( 5 6 )
		      strands: #( '+' '-' )
		      metadata: Dictionary new.
	red := gr reduce.
	self assert: red size equals: 2
]

{ #category : 'tests' }
BioGenomicRangesTest >> testReduceMergesAdjacent [

	| gr red |
	gr := BioGenomicRanges
		      seqnames: #( 'chr1' 'chr1' )
		      starts: #( 1 6 )
		      ends: #( 5 10 )
		      strands: #( '+' '+' )
		      metadata: Dictionary new.
	red := gr reduce.
	self assert: red size equals: 1.
	self assert: red start first equals: 1.
	self assert: (red end at: 1) equals: 10
]

{ #category : 'tests' }
BioGenomicRangesTest >> testReject [

	| gr selected |
	gr := self sampleGenomicRanges01.
	selected := gr reject: [ :r | r seqname = 'chr1' ].
	self assert: selected size equals: 1.
	self assert: selected seqnames first equals: 'chr2'
]

{ #category : 'tests' }
BioGenomicRangesTest >> testSelect [

	| gr selected |
	gr := self sampleGenomicRanges01.
	selected := gr select: [ :r | r seqname = 'chr1' ].
	self assert: selected size equals: 2
]

{ #category : 'tests' }
BioGenomicRangesTest >> testSetdiffSelfIsEmpty [
	self assert: self sampleGenomicRanges01 setdiff isEmpty
]

{ #category : 'tests' }
BioGenomicRangesTest >> testShiftMinusOperator [
	| gr shifted |
	gr := self sampleGenomicRanges01.
	shifted := gr - 1.
	self assert: (shifted start at: 2) equals: 9
]

{ #category : 'tests' }
BioGenomicRangesTest >> testShiftPlusOperator [

	| gr shifted |
	gr := self sampleGenomicRanges01.
	shifted := gr + 10.
	self assert: shifted start first equals: 11.
	self assert: shifted end first equals: 15
]
