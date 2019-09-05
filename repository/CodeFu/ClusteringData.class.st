Class {
	#name : #ClusteringData,
	#superclass : #SymetricMatrix,
	#instVars : [
		'indices',
		'value',
		'clusters',
		'foundA0',
		'foundB0'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
ClusteringData class >> onDistanceSquare: distanceSquare [

	^(self basicNew)
		initialize: distanceSquare;
		yourself
]

{ #category : #private }
ClusteringData class >> vectorSpecies [

	^Array
]

{ #category : #'linkage functions' }
ClusteringData >> averageLinkage [

	| weightA weightB sizeA sizeB |
	sizeA := (clusters at: foundA0) size asDouble.
	sizeB := (clusters at: foundB0) size asDouble.
	weightA := sizeA / (sizeA + sizeB).
	weightB := sizeB / (sizeA + sizeB).

	self privateLinkage: [ :index0 :valueA :valueB | (valueA * weightA) + (valueB * weightB) ].
]

{ #category : #'linkage functions' }
ClusteringData >> centroid [

	| weightA weightB sizeA sizeB valueC |
	sizeA := (clusters at: foundA0) size asDouble.
	sizeB := (clusters at: foundB0) size asDouble.
	weightA := sizeA / (sizeA + sizeB).
	weightB := sizeB / (sizeA + sizeB).
	valueC := (self at: foundA0 and: foundB0) - ((sizeA * sizeB) / (sizeA + sizeB) squared).
	self privateLinkage: [ :index0 :valueA :valueB | (valueA * weightA) + (valueB * weightB) - valueC ].
]

{ #category : #'linkage functions' }
ClusteringData >> completeLinkage [

	self privateLinkage: [ :index0 :valueA :valueB | valueA max: valueB ].
]

{ #category : #accessing }
ClusteringData >> dendrogram [

	[ indices size = 1 ] assert.
	^clusters at: (indices first).
]

{ #category : #private }
ClusteringData >> findMinimum [
	"This method is written such that it uses primitives only."

	| columnVector |
	value := Float infinity .
	2 to: indices size do: [ :column |
		columnVector := (partialColumns at: (indices at: column)).
		columnVector min < value ifTrue: [
			value := columnVector min.
			foundB0 := (indices at: column).
			foundA0 := columnVector found.
		].
	].
]

{ #category : #'initialize-release' }
ClusteringData >> initialize: distanceMatrix [

	partialColumns := distanceMatrix copyClusteringData collect: [ :each | ClusteringVector withAll: each ].
	value := foundA0 := foundB0 := nil.
	clusters := distanceMatrix items collect: [ :item | Dendrogram with: item ].
	indices := (1 to: partialColumns size) asArray.
	1 to: partialColumns size do: [ :n | (partialColumns at: n) unsetAt: n ]
]

{ #category : #'initialize-release' }
ClusteringData >> initializeRows: m columns: n [

	^self shouldNotImplement
]

{ #category : #'linkage functions' }
ClusteringData >> meanLinkage [

	self privateLinkage: [ :index0 :valueA :valueB | (valueA + valueB) / 2 ].
]

{ #category : #clustering }
ClusteringData >> performClustering: linkageSelector [

	(indices size - 1) timesRepeat: [
		IncrementNotification signalWith: indices size.
	 	self findMinimum.
		self perform: linkageSelector ].
	^self dendrogram
]

{ #category : #private }
ClusteringData >> privateLinkage: aBlock [

	indices := indices copyRemoveAtIndex: (indices indexOf: foundB0).
	indices do: [ :index0 |
		index0 = foundA0 ifFalse: [
			self at: foundA0 and: index0 put: (aBlock
				value: index0
				value: (self at: foundA0 and: index0) 
				value: (self at: foundB0 and: index0)) ].
		self unsetAt: foundB0 and: index0.
	].
	clusters at: foundA0 put: ((clusters at: foundA0) merge: (clusters at: foundB0) at: value).
	clusters at: foundB0 put: nil.
]

{ #category : #'linkage functions' }
ClusteringData >> singleLinkage [

	self privateLinkage: [ :index0 :valueA :valueB | valueA min: valueB ].
]

{ #category : #private }
ClusteringData >> testFindMinimum [

	| value2 foundA02 foundB02 column0 temp row0 |
	self findMinimum.
	value2 := value. foundA02 := foundA0. foundB02  := foundB0.
	value := Float infinity.
	2 to: indices size do: [ :column |
		column0 := indices at: column.
		1 to: (column - 1) do: [ :row |
			temp := (partialColumns at: column0) at: (row0 := (indices at: row)).
			temp < value ifTrue: [ 
				value := temp.
				foundA0 := row0. 
				foundB0 := column0 ]].
	].	
	[ value2 = value & foundA02 = foundA0 & foundB02  = foundB0 ] assert.
	value := value2. foundA0 := foundA02. foundB0 := foundB02.
]

{ #category : #private }
ClusteringData >> testPerformClustering: linkageSelector [

	(indices size - 1) timesRepeat: [
		IncrementNotification signalWith: indices size.
	 	self testFindMinimum.
		self perform: linkageSelector ].
	^self dendrogram
]

{ #category : #private }
ClusteringData >> unsetAt: row and: column [

	^row < column 
		ifTrue: [ (partialColumns at: column) unsetAt: row ]
		ifFalse: [ (partialColumns at: row) unsetAt: column ]
]

{ #category : #'linkage functions' }
ClusteringData >> wardsMethod [

	| sizeA sizeB valueC sizeC weightA weightB weightC |
	sizeA := (clusters at: foundA0) size asDouble.
	sizeB := (clusters at: foundB0) size asDouble.
	valueC := (self at: foundA0 and: foundB0).

	self privateLinkage: [ :index0 :valueA :valueB |
		sizeC := (clusters at: index0) size.
		weightA := (sizeA + sizeC) / (sizeA + sizeB + sizeC).
		weightB := (sizeB + sizeC) / (sizeA + sizeB + sizeC).
		weightC := sizeC / (sizeA + sizeB + sizeC).
		(valueA * weightA) + (valueB * weightB) - (valueC * weightC) 
	].
]
