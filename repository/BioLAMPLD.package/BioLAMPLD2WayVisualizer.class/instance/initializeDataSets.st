initialization
initializeDataSets

	self heterozygousRowIndex: 2.

	self homozygousRowIndex: 1.
	self configureDataSet: self popFrequency connectColor: Color blue.

	self homozygousRowIndex: 3.	
	self configureDataSet: self popFrequency connectColor: Color red.