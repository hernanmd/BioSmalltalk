Class {
	#name : #SequenceableCollectionSorter,
	#superclass : #Object,
	#instVars : [
		'collection',
		'sortBlock',
		'atSelector',
		'putSelector',
		'sizeSelector'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
SequenceableCollectionSorter class >> on: aCollection [
	"Answer a Sorter on aCollection using [:a :b | a <= b]."

	^self on: aCollection using: [:a :b | a <= b]
]

{ #category : #'instance creation' }
SequenceableCollectionSorter class >> on: aCollection using: aBlock [
	"Answer a Sorter on aCollection using aBlock.
	The Block is a function of two arguments. "

	| s |
	s := self new.
	s sortBlock: aBlock.
	s collection: aCollection.
	^s
]

{ #category : #'instance creation' }
SequenceableCollectionSorter class >> sort: aCollection [
	"Sort aCollection using [:a :b | a <= b]."

	^self sort: aCollection using: [:a :b | a <= b]
]

{ #category : #'instance creation' }
SequenceableCollectionSorter class >> sort: aCollection using: aBlock [
	"Sort aCollection using aBlock.
	The Block is a function of two arguments. "

	| s |
	s := self new.
	s sortBlock: aBlock.
	s collection: aCollection.
	s sort.
	^s
]

{ #category : #sorting }
SequenceableCollectionSorter >> addAllSorted: aCollection [ 
	"Include each element of aCollection as one of the receiver's collection's
	elements preserving sort order."

	aCollection size > (self collectionSize // 3)
		ifTrue: 
			["Faster to add the new elements and resort"
			aCollection do: [:each | collection addLast: each].
			self sort]
		ifFalse: ["Faster to add the elements individually in their proper places"
			aCollection do: [:each | self addSorted: each]]
]

{ #category : #sorting }
SequenceableCollectionSorter >> addSorted: newObject [ 
	"Include newObject as one of the receiver's collections elements 
	while preserving sort order. Answer the index newObject is inserted 
	at."

	| nextIndex |
	collection isEmpty ifTrue: [^collection addLast: newObject].
	nextIndex := self indexForInserting: newObject.
	collection add: newObject beforeIndex: nextIndex.
	^nextIndex
]

{ #category : #accessing }
SequenceableCollectionSorter >> atSelector: aSymbol [
	"Set the selector to be used for performing an at:"

	atSelector := aSymbol
]

{ #category : #accessing }
SequenceableCollectionSorter >> collection [

	^collection
]

{ #category : #accessing }
SequenceableCollectionSorter >> collection: aCollection [

	collection := aCollection
]

{ #category : #private }
SequenceableCollectionSorter >> collectionAt: anIndex [

	^atSelector == nil
		ifTrue: [collection at: anIndex]
		ifFalse: [collection perform: atSelector with: anIndex]
]

{ #category : #private }
SequenceableCollectionSorter >> collectionAt: anIndex put: aValue [

	^putSelector == nil
		ifTrue: [collection at: anIndex put: aValue]
		ifFalse: [collection perform: putSelector with: anIndex with: aValue]
]

{ #category : #private }
SequenceableCollectionSorter >> collectionSize [

	^sizeSelector == nil
		ifTrue: [collection size]
		ifFalse: [collection perform: sizeSelector]
]

{ #category : #private }
SequenceableCollectionSorter >> hybridSort: i to: j with: scratch [
	"Sort elements i through j of self to be non-descending according to sortBlock.
	 Use quicksort for large ranges and insertion sort for ranges within scratch size."
	"The prefix d means the data at that index."
	| di dij dj tt ij k l n |
	"Nothing to sort."
	(n := j + 1 - i) <= 1 ifTrue: [^self].
	n <= scratch size ifTrue:
		["Few elements; use an insertion sort."
		scratch at: 1 put: (self collectionAt: i).
		2 to: n do:
			[:x|
			di := self collectionAt: i + x - 1.
			k := 1.
			 [k < x and: [sortBlock value: (scratch at: k) value: di]]
				whileTrue:
					[k := k + 1].
			 k < x ifTrue:
				[scratch replaceFrom: k + 1 to: x with: scratch startingAt: k].
			scratch at: k put: di].
		1 to: n do:
			[:x| self collectionAt: i + x - 1 put: (scratch at: x)].
		^self].
	
	"Assume more than three elements."
	"Sort di,dj and dij."
	di := self collectionAt: i.
	dj := self collectionAt: j.
	(sortBlock value: di value: dj) ifFalse: 
		[self swap: i with: j.
		 tt := di.
		 di := dj.
		 dj := tt].	"i.e., should di precede dj?"
	ij := (i + j) // 2.	"ij is the midpoint of i and j."
	dij := self collectionAt: ij.	"Sort di,dij,dj.  Make dij be their median."
	(sortBlock value: di value: dij) "i.e. should di precede dij?"
		ifTrue: 
			[(sortBlock value: dij value: dj) ifFalse: "i.e., should dij precede dj?"
				[self swap: j with: ij.
				dij := dj]]
		ifFalse: "i.e. di should come after dij"
			[self swap: i with: ij.
			dij := di].
	"Find k>i and l<j such that dk,dij,dl are in reverse order.
	 Swap k and l.  Repeat this procedure until k and l pass each other."
	k := i.
	l := j.
	[	[l := l - 1.
		k <= l and: [sortBlock value: dij value: (self collectionAt: l)]] 
			whileTrue.	"i.e. while dl succeeds dij"
		[k := k + 1.
		k <= l and: [sortBlock value: (self collectionAt: k) value: dij]] 
			whileTrue.	"i.e. while dij succeeds dk"
	k <= l] 
			whileTrue:
				[self swap: k with: l].
	"Skip already sorted ranges."
	[k < j and: [sortBlock value: (self collectionAt: k) value: dij]]
		whileTrue:
			[k := k + 1].
	"Now l<k (either 1 or 2 less), and di through dl are all less than or equal to dk
	 through dj.  Sort those two segments."
	self hybridSort: i to: l with: scratch.
	self hybridSort: k to: j with: scratch
]

{ #category : #sorting }
SequenceableCollectionSorter >> indexForInserting: newObject [ 
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
]

{ #category : #accessing }
SequenceableCollectionSorter >> putSelector: aSymbol [
	"Set the selector to be used for performing an at:put:"

	putSelector := aSymbol
]

{ #category : #private }
SequenceableCollectionSorter >> quickSort: i to: j [ 
	"Sort elements i through j of self to be nondescending according to sortBlock."

	"The prefix d means the data at that index."
	| di dij dj tt ij k l n |
	(n := j + 1 - i) <= 1 ifTrue: [^self].	"Nothing to sort."
	"Sort di,dj."
	di := self collectionAt: i.
	dj := self collectionAt: j.
	(sortBlock value: di value: dj)  "i.e., should di precede dj?"
		ifFalse: 
			[self swap: i with: j.
			tt := di.
			di := dj.
			dj := tt].
	n > 2
		ifTrue: 
			["More than two elements."
			ij := i + j // 2.	"ij is the midpoint of i and j."
			dij := self collectionAt: ij.
			(sortBlock value: di value: dij)
				ifTrue: ["Sort di,dij,dj. Make dij be their median."
					"i.e. should di precede dij?"
					(sortBlock value: dij value: dj)
						ifFalse: 
							["i.e., should dij precede dj?"
							self swap: j with: ij.
							dij := dj]]
				ifFalse: 
					["i.e. di should come after dij"
					self swap: i with: ij.
					dij := di].
			n > 3
				ifTrue: 
					["More than three elements."
					"Find k>i and l<j such that dk,dij,dl are in reverse order. 
					Swap k and l. Repeat this procedure until k and l pass each other."
					k := i.
					l := j.
					[[l := l - 1.
					k <= l and: [sortBlock value: dij value: (self collectionAt: l)]] whileTrue.  "i.e. while dl succeeds dij"
					[k := k + 1.
					k <= l and: [sortBlock value: (self collectionAt: k)
							value: dij]] whileTrue.	"i.e. while dij succeeds dk"
					k <= l]
						whileTrue: [self swap: k with: l].	"Now l<k (either 1 or 2 less), and di through dl are all less than or equal to dk 
					through dj. Sort those two segments."
					self quickSort: i to: l.
					self quickSort: k to: j]]
]

{ #category : #accessing }
SequenceableCollectionSorter >> sizeSelector: aSymbol [

	sizeSelector := aSymbol
]

{ #category : #sorting }
SequenceableCollectionSorter >> sort [

	self sort: 1 to: self collectionSize
]

{ #category : #sorting }
SequenceableCollectionSorter >> sort: i to: j [
	^self hybridSort: i to: j with: (Array new: 10)
]

{ #category : #accessing }
SequenceableCollectionSorter >> sortBlock [
	"Answer the Block which is the criterion for sorting elements of
	the receivers collection."

	^sortBlock
]

{ #category : #accessing }
SequenceableCollectionSorter >> sortBlock: aBlock [ 
	"Make the argument, aBlock, be the criterion for ordering elements of the
	receivers collection."

	sortBlock := aBlock
]

{ #category : #private }
SequenceableCollectionSorter >> swap: i with: j [ 

	| t |
	t := self collectionAt: i.
	self collectionAt: i put: (self collectionAt: j).
	self collectionAt: j put: t
]
