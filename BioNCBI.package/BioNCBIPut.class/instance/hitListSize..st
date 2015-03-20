accessing
hitListSize: aSmallInteger
	" Set the number of hits to return to be aSmallInteger "
	
	self clientUrl queryAt: 'HITLIST_SIZE' put: aSmallInteger asString