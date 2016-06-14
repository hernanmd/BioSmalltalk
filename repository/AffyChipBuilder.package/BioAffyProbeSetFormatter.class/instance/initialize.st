initialize-release
initialize
	" Private - Set initial values for formatting "

	super initialize.	
	self initializeFamilies.
	self extractAX: false.
	self extractRS: true.
	self extractAlleleFrqs: true.
	self extractGeneAnnot: false.