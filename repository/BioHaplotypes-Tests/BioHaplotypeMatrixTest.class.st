Class {
	#name : 'BioHaplotypeMatrixTest',
	#superclass : 'TestCase',
	#category : 'BioHaplotypes-Tests-Core',
	#package : 'BioHaplotypes-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
BioHaplotypeMatrixTest >> exampleMatrix [

	^ BioHaplotypes exampleSimple asHaplotypeMatrix
]

{ #category : 'tests' }
BioHaplotypeMatrixTest >> testAccessing [

	| mat |
	mat := self exampleMatrix.
	self assert: (mat at: 1 at: 1) equals: 'A'.
	self assert: (mat at: 1 at: 2) equals: 'C'.
	self assert: (mat at: 2 at: 1) equals: 'T'.
	self assert: (mat at: 2 at: 2) equals: 'G'
]

{ #category : 'tests' }
BioHaplotypeMatrixTest >> testDimensions [

	| mat |
	mat := self exampleMatrix.
	self assert: mat rows equals: 2.
	self assert: mat columns equals: 2
]

{ #category : 'tests' }
BioHaplotypeMatrixTest >> testHammingDistances [

	| mat dist |
	mat := self exampleMatrix.
	dist := mat pairwiseHammingDistances.
	self assert: (dist at: 1 at: 1) equals: 0.
	self assert: (dist at: 1 at: 2) equals: 2
]
