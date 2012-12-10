sorting
indexForInserting: newObject 
	"Answer the index where newObject should be placed into the receivers collection in
	order to preserve sort order."

	| index low high |
	low := 1.
	high := self collectionSize.
	[index := high + low // 2.
	low > high]
		whileFalse: 
			[(sortBlock value: (self collectionAt: index) value: newObject)
				ifTrue: [low := index + 1]
				ifFalse: [high := index - 1]].
	^low