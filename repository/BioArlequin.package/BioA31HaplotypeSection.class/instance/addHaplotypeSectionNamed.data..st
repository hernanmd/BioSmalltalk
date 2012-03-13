adding configurations
addHaplotypeSectionNamed: aString data: aCollection
	" Set the values for the receiver "
	
	self at: self class haplotypeListNameId put: aString printString.
	self at: self class haplotypeListId put: aCollection