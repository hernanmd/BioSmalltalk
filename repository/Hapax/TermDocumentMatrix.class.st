Class {
	#name : #TermDocumentMatrix,
	#superclass : #MatrixDecorator,
	#instVars : [
		'termMap',
		'documentMap',
		'localWeighting',
		'globalWeighting',
		'decomposition',
		'expectedRank'
	],
	#category : 'Hapax'
}

{ #category : #'instance creation' }
TermDocumentMatrix class >> empty [

	| tdm |
	tdm := super on: SparseRowMatrix new.
	tdm initialize.
	^tdm
]

{ #category : #'instance creation' }
TermDocumentMatrix class >> on: aVocabulary [

	^(self empty)
		addVocabulary: aVocabulary;
		yourself
]

{ #category : #'SVD decomposing' }
TermDocumentMatrix >> actualRank [

	^self decomposition rank
]

{ #category : #adding }
TermDocumentMatrix >> addVocabulary: vocabulary [

	vocabulary documentTermCountDo: [ :document :term :count |
		| row column |
		row := termMap 
			atValue: term 
			ifAbsentPut: [ matrix addRow. matrix rowSize ].
		column := documentMap 
			atValue: document 
			ifAbsentPut: [ matrix addColumn. matrix columnSize ].
		matrix 
			at: row and: column 
			add: count 
		].
]

{ #category : #'SVD decomposing' }
TermDocumentMatrix >> decomposition [

	^decomposition ifNil: [ decomposition := SingularValueDecomposition on: matrix with: self expectedRank ]
]

{ #category : #'SVD decomposing' }
TermDocumentMatrix >> documentCorrelation [

	^self documentCorrelation: (self actualRank min: self expectedRank)
]

{ #category : #'SVD decomposing' }
TermDocumentMatrix >> documentCorrelation: rank [

	| svd items |
	svd := self decomposition.
	items := ((svd V: rank) *~ (svd S: rank)) rows.
	items := items collectWithIndex: [ :vector :index | 
		VectorItem with: (documentMap atKey: index) and: (UnitVector on: vector) ].
	^PartitionCorrelationSquare on: items.
]

{ #category : #accessing }
TermDocumentMatrix >> documentSize [

	^self columnSize
]

{ #category : #accessing }
TermDocumentMatrix >> documents [

	^documentMap asArray
]

{ #category : #'SVD decomposing' }
TermDocumentMatrix >> estimateRank [

	| rank |
	rank := ((matrix columnSize * matrix rowSize) ** 0.2) ceiling.
	^(((rank max: 3) min: matrix columnSize) min: matrix rowSize)
]

{ #category : #'SVD decomposing' }
TermDocumentMatrix >> expectedRank [
	^expectedRank ifNil: [ self estimateRank ]
]

{ #category : #'SVD decomposing' }
TermDocumentMatrix >> expectedRank: number [

	^expectedRank := number
]

{ #category : #accessing }
TermDocumentMatrix >> frequencyOf: term in: document [

	^matrix at: (termMap atValue: term) and: (documentMap atValue: document)
]

{ #category : #weighting }
TermDocumentMatrix >> globalWeighting [
	^globalWeighting
]

{ #category : #weighting }
TermDocumentMatrix >> globalWeighting: anObject [
	globalWeighting := anObject
]

{ #category : #'initialize-release' }
TermDocumentMatrix >> initialize [

	termMap := BidirectionalMap new.
	documentMap := BidirectionalMap new.
	localWeighting := TermFrequency new.
	globalWeighting := InverseDocumentFrequency new.
]

{ #category : #weighting }
TermDocumentMatrix >> localWeighting [
	^localWeighting
]

{ #category : #weighting }
TermDocumentMatrix >> localWeighting: anObject [
	localWeighting := anObject
]

{ #category : #accessing }
TermDocumentMatrix >> numberOfDocuments [

	^self columnSize
]

{ #category : #removing }
TermDocumentMatrix >> rejectTermRow: aBlock [

	| keep |
	keep := OrderedCollection new: matrix rowSize.
	matrix rows doWithIndex: [ :row :index || term |
		term := (termMap atKey: index).
		(aBlock value: term value: row) 
			ifFalse: [ keep add: term -> row ]
	].
	keep := keep collectAssocations.
	matrix := SparseRowMatrix onRows: keep value.
	termMap := BidirectionalMap withIndicesAndElements: keep key.
]

{ #category : #accessing }
TermDocumentMatrix >> removeEnglishStopwords [

	^self removeStopwords: Stopwords english
]

{ #category : #removing }
TermDocumentMatrix >> removeHapaxes [

	^self removeLegomena: 1
]

{ #category : #removing }
TermDocumentMatrix >> removeLegomena: threshold [

	^self rejectTermRow: [ :term :row |
		(globalWeighting documentFrequency: row) <= threshold ]
]

{ #category : #accessing }
TermDocumentMatrix >> removeSpanishStopwords [

	^self removeStopwords: Stopwords spanish
]

{ #category : #removing }
TermDocumentMatrix >> removeStopwords: stopwordList [

	^self rejectTermRow: [ :term :row | 
		stopwordList includes: term asString ]
]

{ #category : #'SVD decomposing' }
TermDocumentMatrix >> termCorrelation [

	^self termCorrelation: (self actualRank min: self expectedRank)
]

{ #category : #'SVD decomposing' }
TermDocumentMatrix >> termCorrelation: rank [

	| svd items |
	svd := self decomposition.
	items := ((svd U: rank) *~ (svd S: rank)) rows.
	items := items collectWithIndex: [ :vector :index | 
		VectorItem with: (termMap atKey: index) and: (UnitVector on: vector) ].
	^PartitionCorrelationSquare on: items.
]

{ #category : #accessing }
TermDocumentMatrix >> termRowAssociations [

	^(self allTerms -> matrix rows) associateCollections
]

{ #category : #accessing }
TermDocumentMatrix >> termSize [

	^self rowSize
]

{ #category : #accessing }
TermDocumentMatrix >> terms [

	^termMap asArray
]

{ #category : #weighting }
TermDocumentMatrix >> weight [

	| newMatrix |
	newMatrix := SparseRowMatrix new: matrix dimension.
	matrix rows with: newMatrix rows do: [ :row :newRow |
		| globalWeight  |
		globalWeight := globalWeighting forTerm: row.
		row doSparseWithIndex: [ :each :index |
			newRow at: index put: (localWeighting forValue: each) * globalWeight ]].
	matrix := newMatrix.
]
