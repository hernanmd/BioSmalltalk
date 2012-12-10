instance creation
on: aCollection using: aBlock
	"Answer a Sorter on aCollection using aBlock.
	The Block is a function of two arguments. "

	| s |
	s := self new.
	s sortBlock: aBlock.
	s collection: aCollection.
	^s