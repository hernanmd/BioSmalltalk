initialization
initializeGrapher
	" See superimplementor's comment "

	self grapher: RTGrapher new.
	self grapher extent: self extent.
	self configureDataSet: (matrix rowAt: 1) connectColor: Color blue.
	self configureDataSet: (matrix rowAt: 2) connectColor: Color green.
	self configureDataSet: (matrix rowAt: 3) connectColor: Color red.
	self grapher axisX title: self axisXTitle.
	self grapher axisY title: self axisYTitle.
	^ self grapher