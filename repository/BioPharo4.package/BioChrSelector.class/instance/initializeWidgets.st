initialization
initializeWidgets

	self instantiateModels: #(
		organismList 	SpcLabeledList
		chrList 		SpcLabeledList
		toolbar 		SpcTwoButtonToolbar
	).

	self organismList 
		items: BioSpeciesLists faoSpeciesWithChr keys;
		label: 'Select Organism'.
	self chrList 
		label: 'Select Chromosome(s)'.
	self toolbar 
		firstButtonLabel: 'Ok';
		secondButtonLabel: 'Cancel'
