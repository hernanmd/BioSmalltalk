accessing
buildSelector: row
	" Private - Parse the row corresponding to an option "
	
	| mthSelector mthParameter selector |

	((mthSelector := row first) includes: $=)
		ifTrue: [ 
			selector := mthSelector copyUpTo: $=.
			mthParameter := (mthSelector  findBetweenSubStrs: '<>') last.
			self targetSelector: selector withArgument: mthParameter ]
		ifFalse: [ self targetSelector: mthSelector ].