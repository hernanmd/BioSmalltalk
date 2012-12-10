examples
numbers: aCollection
	"ClusterEngine numbers: #(1 2 9 0 7 2 4 3)"
	^(ClusterEngine with: aCollection using: [:a :b | (a - b) * (a - b)]) averageLinkage elements