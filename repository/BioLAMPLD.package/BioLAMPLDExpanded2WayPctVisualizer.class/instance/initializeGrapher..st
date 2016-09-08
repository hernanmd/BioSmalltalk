initialization
initializeGrapher: titleString
	" See superimplementor's comment "

	self initializeBasicGrapher: titleString.
	self initializeDataSets.
	self initializeTicks.
	self initializeLegends.
	^ self grapher
