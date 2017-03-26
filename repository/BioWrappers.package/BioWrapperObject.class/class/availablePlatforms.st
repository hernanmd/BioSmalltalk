accessing
availablePlatforms
	" Answer a <Collection> of <String> with receiver's supported platforms. 
	Each supporteed platform name must be obtained through
	
	Smalltalk currentVersion. 
	Smalltalk os name.
	"
	
	self subclassResponsibility 