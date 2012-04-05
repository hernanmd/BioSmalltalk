accessing
hitListSize: aSmallInteger
	" Number of hits to return "
	
	self clientUrl addParameters: 'HITLIST_SIZE=' , aSmallInteger asString