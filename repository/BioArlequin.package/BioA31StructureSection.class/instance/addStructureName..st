accessing
addStructureName: aString
	" Set aString structure name to the receiver "

	self 
		at: self class structureNameId key
		put: aString
