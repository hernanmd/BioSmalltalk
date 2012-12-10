sorting
addAllSorted: aCollection 
	"Include each element of aCollection as one of the receiver's collection's
	elements preserving sort order."

	aCollection size > (self collectionSize // 3)
		ifTrue: 
			["Faster to add the new elements and resort"
			aCollection do: [:each | collection addLast: each].
			self sort]
		ifFalse: ["Faster to add the elements individually in their proper places"
			aCollection do: [:each | self addSorted: each]]