adding
addDocument: anObject with: terms

	self addDocument: anObject.
	self atDocument: anObject add: terms.