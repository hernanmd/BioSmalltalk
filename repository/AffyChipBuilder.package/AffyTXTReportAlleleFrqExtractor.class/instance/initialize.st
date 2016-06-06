initialize-release
initialize

	super initialize.	
	self initializeFamilies.
	self extractAX: false.
	self extractRS: true.
	self extractAlleleFrqs: true.
