initialization
initializeDataSets

	self heterozygousRowIndex: 2.

	self homozygousRowIndex: 1.
	self configureDataSet: self popFrequency connectColor: self population1Color.

	self homozygousRowIndex: 3.	
	self configureDataSet: self popFrequency connectColor: self population2Color.