accessing
ambiguousAlphabets
	" Answer a <Collection> with the ambiguous alphabet subclasses "
	
	^ self allSubclasses select: #isAmbiguousAlphabet