accessing
uids: aCollection
	" Set the client's identifiers list to aCollection "
	
	self client 
		addParameters: 
			( self idCollectionClass withAll: aCollection ) baseUrl