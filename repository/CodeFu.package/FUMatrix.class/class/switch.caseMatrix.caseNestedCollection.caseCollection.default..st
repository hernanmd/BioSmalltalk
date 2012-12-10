private
switch: anObject caseMatrix: matrixBlock caseNestedCollection: nestedColletionBlock caseCollection: collectionBlock default: defaultBlock 
	(anObject isKindOf: FUMatrix) ifTrue: [ ^ matrixBlock value ].
	(anObject isKindOf: Collection) ifTrue: 
		[ (anObject isEmpty not and: 
			[ anObject allSatisfy: 
				[ : each | 
				(each isKindOf: Collection) and: [ each size = anObject first size ] ] ]) 
			ifTrue: [ ^ nestedColletionBlock value ]
			ifFalse: [ ^ collectionBlock value ] ].
	^ defaultBlock value