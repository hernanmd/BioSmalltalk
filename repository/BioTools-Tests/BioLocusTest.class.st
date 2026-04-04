"
Tests for BioLocus interval and coordinate behavior.
"
Class {
	#name : 'BioLocusTest',
	#superclass : 'TestCase',
	#category : 'BioTools-Tests-Genomic-Ranges',
	#package : 'BioTools-Tests',
	#tag : 'Genomic-Ranges'
}

{ #category : 'tests' }
BioLocusTest >> testContainsLocusAndUnion [
	| outer inner disjoint union |
	outer := BioLocus new
		name: 'outer';
		chrLocation: 'chr2';
		from: 10 to: 100;
		yourself.
	inner := BioLocus new
		name: 'inner';
		chrLocation: 'chr2';
		from: 25 to: 40;
		yourself.
	disjoint := BioLocus new
		name: 'disjoint';
		chrLocation: 'chr2';
		from: 150 to: 200;
		yourself.

	self assert: (outer containsLocus: inner).
	self deny: (inner containsLocus: outer).
	self deny: (outer overlaps: disjoint).
	self assert: (outer distanceTo: disjoint) equals: 50.

	union := outer unionWith: disjoint.
	self assert: union notNil.
	self assert: union start equals: 10.
	self assert: union end equals: 200
]

{ #category : 'tests' }
BioLocusTest >> testCoordinateConversionsAndNormalization [
	| locus |
	locus := BioLocus new
		name: 'x';
		chrLocation: 'chrX';
		from: 30 to: 10;
		yourself.

	self deny: locus isValidRange.
	locus normalizeBounds.
	self assert: locus isValidRange.
	self assert: locus start equals: 10.
	self assert: locus end equals: 30.
	self assert: locus length equals: 21.
	self assert: locus asBedInterval equals: #(9 30).
	self assert: locus asGffInterval equals: #(10 30)
]

{ #category : 'tests' }
BioLocusTest >> testOverlapIntersectionAndDistance [
	| a b i |
	a := BioLocus new
		name: 'a';
		chrLocation: 'chr1';
		from: 100 to: 200;
		yourself.
	b := BioLocus new
		name: 'b';
		chrLocation: 'chr1';
		from: 150 to: 250;
		yourself.

	self assert: (a overlaps: b).
	i := a intersectionWith: b.
	self assert: i notNil.
	self assert: i start equals: 150.
	self assert: i end equals: 200.
	self assert: (a distanceTo: b) equals: 0
]
