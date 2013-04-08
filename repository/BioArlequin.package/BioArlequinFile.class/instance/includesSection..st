testing
includesSection: label
"	self needsWork."
	
	^ (super includesSection: label) 
		or: [ (self sectionDictionaries includesKey: 1) 
			or: [ dataSection isNil not ] ]