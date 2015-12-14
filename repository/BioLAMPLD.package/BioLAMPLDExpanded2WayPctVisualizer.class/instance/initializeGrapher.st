initialization
initializeGrapher
	" See superimplementor's comment "

	self grapher: RTGrapher new.
	self grapher extent: self extent.
	self configureDataSet: self popFrequency connectColor: self color.
	self grapher axisX title: self axisXTitle.
	self grapher axisY title: self axisYTitle.
	^ self grapher
