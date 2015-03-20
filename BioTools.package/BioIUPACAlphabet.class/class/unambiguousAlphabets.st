accessing
unambiguousAlphabets
	" Answer a <Collection> with the unambiguous alphabet subclasses "
	
	^ self allSubclasses reject: #isAmbiguousAlphabet