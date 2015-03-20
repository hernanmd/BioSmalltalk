accessing
addNbGroups: aNumber
	" Set the number of groups defined in the structure "
	
	self 
		at: self class nbGroupsId key
		put: aNumber greaseString