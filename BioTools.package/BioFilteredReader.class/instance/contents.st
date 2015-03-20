accessing
contents
	" This is the <filtering> protocol. Answer a BioSearchResult, if the receiver already contains filters then answer the result object given by the last filter "
	
	^ self filters isEmpty
		ifTrue: [ self addResult ]
		ifFalse: [ self lastFilter contents ]