Class {
	#name : 'BioPhyloNewickReaderTest',
	#superclass : 'TestCase',
	#category : 'BioPhylogenetics-Tests-Tests',
	#package : 'BioPhylogenetics-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
BioPhyloNewickReaderTest >> testBranchLengths [
	| t |
	t := BioPhyloTree readFromNewick: '(A:0.1,B:0.2):0.0;'.
	self assert: t countTerminals equals: 2.
	self assert: (t cladeNamed: 'A') branchLength equals: 0.1
]

{ #category : 'tests' }
BioPhyloNewickReaderTest >> testNested [
	| t |
	t := BioPhyloTree readFromNewick: '((A,B),(C,D));'.
	self assert: t countTerminals equals: 4.
	self assert: t root children size equals: 2.
	self assert: (t commonAncestor: #('A' 'B')) notNil
]

{ #category : 'tests' }
BioPhyloNewickReaderTest >> testRoundTrip [
	| newick t back |
	newick := '((A:0.1,B:0.2):0.3,(C:0.4,D:0.5):0.6);'.
	t := BioPhyloTree readFromNewick: newick.
	back := BioPhyloNewickWriter write: t.
	self assert: back equals: newick
]

{ #category : 'tests' }
BioPhyloNewickReaderTest >> testSimpleParse [
	| t |
	t := BioPhyloTree readFromNewick: '(A,B);'.
	self assert: t countTerminals equals: 2.
	self assert: (t leaves collect: #name) asArray equals: #('A' 'B')
]

{ #category : 'tests' }
BioPhyloNewickReaderTest >> testTrailingSemicolonOptional [
	self assert: (BioPhyloTree readFromNewick: '(A,B)') countTerminals equals: 2
]
