initialization
initializeGrapher
	" Answer a new grapher for the receiver's data values "

	self grapher: RTGrapher new.
	self grapher extent: self extent. 
	self grapher add: self configureDataSet.
	self grapher axisX title: self axisXTitle. 
	self grapher axisY title: self axisYTitle.
	^ self grapher
