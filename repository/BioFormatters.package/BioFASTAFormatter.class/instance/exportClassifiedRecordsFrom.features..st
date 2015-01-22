accessing
exportClassifiedRecordsFrom: aPCTProject features: aCollection 

	self flag: #needsWork.
	self initializeStream: aPCTProject matches.
	self writeClassifiedRowsFrom: aPCTProject matches.
	self exportFrom: stream contents.
