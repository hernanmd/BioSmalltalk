private
collectionAt: anIndex put: aValue

	^putSelector == nil
		ifTrue: [collection at: anIndex put: aValue]
		ifFalse: [collection perform: putSelector with: anIndex with: aValue]