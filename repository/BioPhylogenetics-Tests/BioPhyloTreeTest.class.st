Class {
	#name : 'BioPhyloTreeTest',
	#superclass : 'TestCase',
	#instVars : [
		'tree'
	],
	#category : 'BioPhylogenetics-Tests-Tests',
	#package : 'BioPhylogenetics-Tests',
	#tag : 'Tests'
}

{ #category : 'running' }
BioPhyloTreeTest >> setUp [
	super setUp.
	tree := BioPhyloTree readFromNewick: '((A:0.1,B:0.2):0.3,(C:0.4,(D:0.5,E:0.6):0.2):0.4);'
]

{ #category : 'running' }
BioPhyloTreeTest >> tearDown [
	tree := nil.
	super tearDown
]

{ #category : 'tests' }
BioPhyloTreeTest >> testCladeNamed [
	self assert: (tree cladeNamed: 'A') notNil.
	self assert: (tree cladeNamed: 'A') isLeaf.
	self assert: (tree cladeNamed: 'Zzz') isNil
]

{ #category : 'tests' }
BioPhyloTreeTest >> testCommonAncestor [
	| mrca |
	mrca := tree commonAncestor: #('A' 'B').
	self assert: mrca notNil.
	self assert: (mrca leaves collect: #name) asArray equals: #('A' 'B').
	self assert: (tree commonAncestor: #('A' 'E')) equals: tree root
]

{ #category : 'tests' }
BioPhyloTreeTest >> testCountTerminals [
	self assert: tree countTerminals equals: 5.
	self assert: tree root countTerminals equals: 5
]

{ #category : 'tests' }
BioPhyloTreeTest >> testDistanceBetween [
	self assert: (tree distanceBetween: 'A' and: 'B') closeTo: 0.3.
	self assert: (tree distanceBetween: 'D' and: 'E') closeTo: 1.1.
	self assert: (tree distanceBetween: 'A' and: 'Zzz') isNil
]

{ #category : 'tests' }
BioPhyloTreeTest >> testLadderize [
	| before after |
	before := (tree root children collect: #countTerminals) asArray.
	tree ladderize.
	after := (tree root children collect: #countTerminals) asArray.
	self assert: after size equals: before size.
	self assert: after first <= after last.
	self assert: tree countTerminals equals: 5
]

{ #category : 'tests' }
BioPhyloTreeTest >> testLeaves [
	self assert: (tree leaves collect: #name) asArray equals: #('A' 'B' 'C' 'D' 'E')
]

{ #category : 'tests' }
BioPhyloTreeTest >> testTotalBranchLength [
	self assert: tree totalBranchLength closeTo: 2.7
]
