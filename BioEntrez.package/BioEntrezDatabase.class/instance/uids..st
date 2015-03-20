accessing
uids: aCollection
	" Set the client's identifiers list to aCollection "
	
	self client 
		queryAt: 'id' 
		put: (self idCollectionClass withAll: aCollection) baseUrl