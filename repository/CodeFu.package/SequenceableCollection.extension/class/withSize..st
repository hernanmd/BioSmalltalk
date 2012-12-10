*codefu
withSize: size 
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