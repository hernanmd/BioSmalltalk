initialization
initializeBasicGrapher: titleString
	" See superimplementor's comment "

	self grapher: RTGrapher new.
	self grapher 
		extent: self extent;
		title: titleString.