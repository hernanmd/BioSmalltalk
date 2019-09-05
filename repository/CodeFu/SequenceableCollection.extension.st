Extension { #name : #SequenceableCollection }

{ #category : #'*codefu' }
SequenceableCollection >> asVector [

	^ArrayVector withAll: self
]

{ #category : #'*codefu' }
SequenceableCollection >> copyRemoveAtIndex: index [
	"Return a copt of the receiver without the element at index."

	| newSequenceableCollection |
	newSequenceableCollection := self species withSize: self size - 1.
	newSequenceableCollection
		replaceFrom: 1
		to: index - 1
		with: self
		startingAt: 1.
	newSequenceableCollection
		replaceFrom: index
		to: self size - 1
		with: self
		startingAt: index +1.
	^newSequenceableCollection
]

{ #category : #'*codefu' }
SequenceableCollection >> hasSize: size [

	^self size = size
]

{ #category : #'*codefu' }
SequenceableCollection >> reverseSort: aSortBlock [
	"-- yet another selector for #sortReverse: --"
	"-- not deprecated, since both writings are reasonable --"

	self sortReverse: aSortBlock
]

{ #category : #'*codefu' }
SequenceableCollection >> sortReverse: aSortBlock [
	"Sort the receiver in-place in reversed order using aSortBlock, which can be one
	of: a closure with two agrument, a closure with one argument or a symbol."

	| block |
	block := aSortBlock asSortBlock.
	SequenceableCollectionSorter sort: self using: [ :a :b | block value: b value: a ].
	^self
]

{ #category : #'*codefu' }
SequenceableCollection >> sorted: aBlock [
	| sortedVersion |
	sortedVersion := self copy.
	SequenceableCollectionSorter sort: sortedVersion using: aBlock.
	^sortedVersion.
]

{ #category : #'*codefu' }
SequenceableCollection >> subscriptBoundsErrorFor: selector  index:  idx [
	^ self errorOutOfBounds 
]

{ #category : #'*codefu' }
SequenceableCollection class >> withSize: size [ 
	"In general, the argument to #new: refers to the capacity of the 
	collection that is created, not the size. For ArrayedCollections, the 
	two are synonymous, but for collections that support #add: and 
	#remove:, this is not true. 
	
	This method creates a collection with the specified capacity AND 
	size, filling in the elements of the collection with the default 
	element for the collection. 
	
	Some collection types such as LinkedList, Interval, and 
	SortedCollection, may be unable to support this protocol for one 
	reason or another."

	^self new: size
]
