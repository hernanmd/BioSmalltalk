accessing hit collection
hitNumbers
	" Answer a Collection of receiver's ordinal number of the hit, with one-offset (e.g., '1, 2...') "
	
	^ self selectNodesNamed: 'Hit_num'.
