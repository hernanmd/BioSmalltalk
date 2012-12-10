testing
testWardsMethod

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