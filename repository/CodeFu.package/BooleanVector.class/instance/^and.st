logical operations
& booleanVector

	[ self size = booleanVector size ] assert.
	^(self class new: self size) 
		setBits: (self getBits bitAnd: booleanVector getBits);
		yourself