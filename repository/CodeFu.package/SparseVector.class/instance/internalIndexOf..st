private
internalIndexOf: anIndex 
	"Searchs for the internal index of anIndex with O(log n) using binary search, returns
	either the internal index of anIndex or, if anIndex is not found, the negated internal 
	index to be used for insertion."

	| mid low high index0 |
	low := 1.
	high := contents size.
	[mid := high + low // 2.
	low > high]
		whileFalse: 
			[ index0 := contents at: mid.
			index0 key <= anIndex
				ifTrue: [
					index0 key = anIndex 
						ifTrue: [ ^mid ]
						ifFalse: [ low := mid + 1 ]]
				ifFalse: [high := mid - 1]].
	^low negated