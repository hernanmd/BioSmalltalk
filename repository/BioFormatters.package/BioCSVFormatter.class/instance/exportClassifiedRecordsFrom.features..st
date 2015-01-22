accessing
exportClassifiedRecordsFrom: project features: fCollection
	" Export data into receiver's format using features contained in fCollection "
	
	self flag: #needsWork.
	self 
		exportFrom: project matches 
		features: fCollection
