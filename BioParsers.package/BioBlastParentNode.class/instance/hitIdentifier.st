accessing hit individually
hitIdentifier
	" Answer a String of receiver's identifier of the database sequence (e.g., 'gi|7297267|gb|AAF52530.1|') "
	
	^ self selectNodeNamed: 'Hit_id'
