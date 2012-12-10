sorting
addSorted: newObject 
	"Include newObject as one of the receiver's collections elements 
	while preserving sort order. Answer the index newObject is inserted 
	at."

	| nextIndex |
	collection isEmpty ifTrue: [^collection addLast: newObject].
	nextIndex := self indexForInserting: newObject.
	collection add: newObject beforeIndex: nextIndex.
	^nextIndex