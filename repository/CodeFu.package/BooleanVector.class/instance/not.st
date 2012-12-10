logical operations
not

	^(self class new: self size) 
		setBits: (self getBits bitInvert);
		yourself