initialization
initializeGrapher
	" See superimplementor's comment "

	self grapher: RTGrapher new.
	self grapher extent: self extent.
	self heterozygousRowIndex: 3.
	self homozygousRowIndex: 2.
	self configureDataSet: self popFrequency connectColor: Color blue.
	self heterozygousRowIndex: 3.
	self homozygousRowIndex: 1.	
	self configureDataSet: self popFrequency connectColor: Color red.
	self grapher axisX title: self axisXTitle.
	self grapher axisY title: self axisYTitle.
	^ self grapher
