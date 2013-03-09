accessing
uids: aCollection
	" Set the client's identifiers list to aCollection "
	
	(self idCollectionClass withAll: aCollection) addParametersTo: self client.