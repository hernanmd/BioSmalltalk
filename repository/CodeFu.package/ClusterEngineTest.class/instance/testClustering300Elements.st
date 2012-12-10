testing
testClustering300Elements

	| input clusty clusters |
	input := Random new next: 300.
	clusty := ClusterEngine with: input.

	1 to: 1

	do: [ :n | clusty averageLinkage ].
	clusters := clusty dendrogram breakInto: 10.

	^clusters