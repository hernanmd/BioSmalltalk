initialize-release
initializeName
	" Private - Initialize receiver's unique name. This is to ensure we can have several classifiers for a case study "
	
	self addUniqueName: (String streamContents: [ : stream |
		stream 
			nextPutAll: self class uniqueName 
			between: $[ and: $] ])