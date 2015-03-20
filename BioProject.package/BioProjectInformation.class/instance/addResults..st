genomic protocol
addResults: anObject
	" Add anObject to the receiver's search results "
	
	( self validate: anObject as: BioResultObject )
		ifTrue: [ 
			self register: BioAddResultCmd.
			self project addResults: anObject ]
		ifFalse: [ self signalInvalidObject: anObject asString , ' is not valid as a search result object' translated ]