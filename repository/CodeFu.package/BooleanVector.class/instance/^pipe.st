logical operations
| booleanVector

	[ self size = booleanVector size ] assert.
	^(self class new: self size) 
		setBits: (self getBits bitOr: booleanVector getBits);
		yourself