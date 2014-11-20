accessing
exportClassifiedRecordsFrom: data features: fCollection
	" Export data into receiver's format using features contained in fCollection "
	
	self flag: #needsWork.
	self exportFrom: data features: fCollection
