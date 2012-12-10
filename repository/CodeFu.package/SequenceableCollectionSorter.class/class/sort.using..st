instance creation
sort: aCollection using: aBlock
	"Sort aCollection using aBlock.
	The Block is a function of two arguments. "

	| s |
	s := self new.
	s sortBlock: aBlock.
	s collection: aCollection.
	s sort.
	^s