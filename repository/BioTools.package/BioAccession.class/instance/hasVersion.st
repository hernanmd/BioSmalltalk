testing
hasVersion
	" Answer <true> if receiver is correctly versioned "
	
	^ self isVersioned and: [ self version asString notEmpty ]