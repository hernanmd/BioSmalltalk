Class {
	#name : 'BioHaplotypesTest',
	#superclass : 'TestCase',
	#category : 'BioHaplotypes-Tests-Core',
	#package : 'BioHaplotypes-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
BioHaplotypesTest >> exampleHaplotypes [
	^ BioHaplotypes exampleSimple
]

{ #category : 'tests' }
BioHaplotypesTest >> testCountAllelesAtLocus [
	| hs |
	hs := self exampleHaplotypes.
	self assert: ((hs countAllelesAtLocus: 1) occurrencesOf: 'A') equals: 1.
	self assert: ((hs countAllelesAtLocus: 1) occurrencesOf: 'T') equals: 1
]

{ #category : 'tests' }
BioHaplotypesTest >> testHaplotypeDiversity [
	| hs |
	hs := self exampleHaplotypes.
	self assert: hs haplotypeDiversity closeTo: 1.0
]

{ #category : 'tests' }
BioHaplotypesTest >> testPairwiseDistances [
	| hs dist |
	hs := self exampleHaplotypes.
	dist := hs pairwiseDistances.
	self assert: (dist at: 1 at: 1) equals: 0.
	self assert: (dist at: 1 at: 2) equals: 2.
	self assert: (dist at: 2 at: 1) equals: 2.
	self assert: (dist at: 2 at: 2) equals: 0
]

{ #category : 'tests' }
BioHaplotypesTest >> testSelect [
	| hs selected |
	hs := self exampleHaplotypes.
	selected := hs select: [ :h | h identifier = 'h1' ].
	self assert: selected size equals: 1
]

{ #category : 'tests' }
BioHaplotypesTest >> testSize [
	| hs |
	hs := self exampleHaplotypes.
	self assert: hs size equals: 2
]

{ #category : 'tests' }
BioHaplotypesTest >> testUniqueHaplotypes [
	| hs |
	hs := self exampleHaplotypes.
	self assert: hs uniqueHaplotypes size equals: 2
]
