accessing
defaultPropertyList
	" See superimplementor's comment "
	
	^ (self blastResult blastProperties collect: #displayName) asSortedCollection