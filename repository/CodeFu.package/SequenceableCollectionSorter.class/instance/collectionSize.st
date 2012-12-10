private
collectionSize

	^sizeSelector == nil
		ifTrue: [collection size]
		ifFalse: [collection perform: sizeSelector]