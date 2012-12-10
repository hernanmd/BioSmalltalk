seriation
orderLeafs

	| a b c d array |
	a := self left left.
	b := self left right.
	c := self right left.
	d := self right right.
	array := Array 
				with: (a dist: c) -> [self left swap]
				with: (a dist: d) -> 
							[self left swap.
							self right swap]
				with: (b dist: c) -> []
				with: (b dist: d) -> [self right swap].
	(array asSortedCollection: #key asSortBlock) first value value.
	self left orderLeafs.
	self right orderLeafs