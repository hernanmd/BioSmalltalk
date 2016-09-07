initialization
initializeGrapher: titleString
	" See superimplementor's comment "

	self grapher: RTGrapher new.
	self grapher 
		extent: self extent;
		title: titleString.
	self initializeDataSets.
	self initializeLegends.
	^ self grapher
