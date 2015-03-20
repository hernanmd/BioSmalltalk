accessing hits
hitIdentifiers
	" Answer a Collection of receiver's identifier of the database sequence (e.g., 'gi|7297267|gb|AAF52530.1|') "
	
	^ self selectNodesNamed: 'Hit_id'.
