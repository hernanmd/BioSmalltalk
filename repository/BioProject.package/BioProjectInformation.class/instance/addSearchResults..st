genomic protocol
addSearchResults: anObject
	" Add anObject to the receiver's search results "
	
	( self validate: anObject as: BioSearchResult )
		ifTrue: [ 
			self register: BioAddResultCmd.
			self project addSearchResults: anObject ]
		ifFalse: [ self signalInvalidObject: anObject asString , ' is not valid as a search result object' translated ]