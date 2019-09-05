Class {
	#name : #ClusterEngine,
	#superclass : #Object,
	#instVars : [
		'distanceMatrix',
		'dendrogram'
	],
	#category : 'CodeFu'
}

{ #category : #examples }
ClusterEngine class >> numbers: aCollection [
	"ClusterEngine numbers: #(1 2 9 0 7 2 4 3)"
	^(ClusterEngine with: aCollection using: [:a :b | (a - b) * (a - b)]) averageLinkage elements
]

{ #category : #'instance creation' }
ClusterEngine class >> with: aCollection [

	^self withDistanceMatrix: (DistanceSquare on: aCollection)
]

{ #category : #'instance creation' }
ClusterEngine class >> with: aCollection using: aDistanceBlock [

	^self withDistanceMatrix: (DistanceSquare on: aCollection using: aDistanceBlock)
]

{ #category : #'instance creation' }
ClusterEngine class >> withDistanceMatrix: distanceMatrix [

	^(self new)
		instVarNamed: 'distanceMatrix' put: distanceMatrix;
		yourself
]

{ #category : #clustering }
ClusterEngine >> averageLinkage [

	^self performClustering: #averageLinkage
]

{ #category : #clustering }
ClusterEngine >> completeLinkage [

	^self performClustering: #completeLinkage
]

{ #category : #accessing }
ClusterEngine >> dendrogram [

	^dendrogram ifNil: [ dendrogram := self averageLinkage ]
]

{ #category : #'private - deprecated' }
ClusterEngine >> hierarchicalClusteringShowProgressUsing: selector [

	^self performClusteringShowProgress: selector
]

{ #category : #'private - deprecated' }
ClusterEngine >> hierarchicalClusteringUsing: selector [

	^self performClustering: selector
]

{ #category : #accessing }
ClusterEngine >> items [

	^distanceMatrix items
]

{ #category : #clustering }
ClusterEngine >> performClustering: linkageSelector [

	| data |
	data := ClusteringData onDistanceSquare: distanceMatrix.
	data performClustering: linkageSelector.
	^dendrogram := data dendrogram
]

{ #category : #clustering }
ClusterEngine >> performClusteringShowProgress: linkageSelector [

	 self performClustering: linkageSelector.
"	Notice 
		showProgress: ('Clustering <1p> items, please wait.' expandMacrosWith: distanceMatrix columnSize)
		complete: (distanceMatrix columnSize * (distanceMatrix columnSize - 1)) / 2
		while: [ self performClustering: linkageSelector ]
		title: 'Clustering'."

	"IncrementNotification signalWith: numberOfTicks"
]

{ #category : #clustering }
ClusterEngine >> singleLinkage [

	^self performClustering: #singleLinkage
]
