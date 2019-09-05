Class {
	#name : #ClusterEngineTest,
	#superclass : #TestCase,
	#category : 'CodeFu'
}

{ #category : #testing }
ClusterEngineTest >> testCentroid [

	| input clusty clusters |
	input := #((1 2 3 5) (11 12 15) (21 22 23 25) (31 32 35) (41 42 43 45 47)).
	clusty := ClusterEngine with: input flatten shuffle.
	clusty hierarchicalClusteringUsing: #centroid.
	clusters := clusty dendrogram breakInto: 5.

	self assert: (clusters size = 5).

	self assert: (clusters contains: [ :each | each equalsTo: (input at: 1)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 2)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 3)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 4)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 5)]).

	^clusters
]

{ #category : #testing }
ClusterEngineTest >> testClustering [

	| input clusty clusters |
	input := #((1 2 3 5) (11 12 15) (21 22 23 25) (31 32 35) (41 42 43 45 47)).
	clusty := ClusterEngine with: input flatten shuffle.
	clusty hierarchicalClusteringUsing: #averageLinkage.
	clusters := clusty dendrogram breakInto: 5.

	self assert: (clusters size = 5).

	self assert: (clusters contains: [ :each | each equalsTo: (input at: 1)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 2)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 3)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 4)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 5)]).

	^clusters
]

{ #category : #testing }
ClusterEngineTest >> testClustering2 [

	| input clusty clusters |
	input := #((1 2 3 5) (11 12 15) (21 22 23 25) (31 32 35) (41 42 43 45 47)).
	clusty := ClusterEngine with: input flatten shuffle.
	clusty hierarchicalClusteringUsing: #centroid.
	clusters := clusty dendrogram breakInto: 5.

	self assert: (clusters size = 5).

	self assert: (clusters contains: [ :each | each equalsTo: (input at: 1)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 2)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 3)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 4)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 5)]).

	^clusters
]

{ #category : #testing }
ClusterEngineTest >> testClustering300Elements [

	| input clusty clusters |
	input := Random new next: 300.
	clusty := ClusterEngine with: input.

	1 to: 1

	do: [ :n | clusty averageLinkage ].
	clusters := clusty dendrogram breakInto: 10.

	^clusters
]

{ #category : #testing }
ClusterEngineTest >> testClusteringOptimization [

	| input clusty |
	input := Random new next: 200.
	clusty := ClusteringData onDistanceSquare: (DistanceSquare on: input).
	"internally compares the optimzed and the unoptimized code."
	clusty testPerformClustering: #averageLinkage.
]

{ #category : #testing }
ClusterEngineTest >> testSeriationEngine [

	| input output |
	input := #(1 2 3 5 11 12 15 21 22 23 25 31 32 35 41 42 43 45 47).
	output := SeriationEngine applyOn: input asArray shuffle.
	self assert: (output = input) | (output reverse = input).
]

{ #category : #testing }
ClusterEngineTest >> testWardsMethod [

	| input clusty clusters |
	input := #((1 2 3 5) (11 12 15) (21 22 23 25) (31 32 35) (41 42 43 45 47)).
	clusty := ClusterEngine with: input flatten shuffle.
	clusty hierarchicalClusteringUsing: #wardsMethod.
	clusters := clusty dendrogram breakInto: 5.

	self assert: (clusters size = 5).

	self assert: (clusters contains: [ :each | each equalsTo: (input at: 1)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 2)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 3)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 4)]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 5)]).

	^clusters
]
