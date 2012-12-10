private
collectionAt: anIndex

	^atSelector == nil
		ifTrue: [collection at: anIndex]
		ifFalse: [collection perform: atSelector with: anIndex]