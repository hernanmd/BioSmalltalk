initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		organismList 	SpcLabeledList 
		chrList 			SpcLabeledList
		toolbar 			SpcTwoButtonToolbar).
	self organismList
		items: BioSpeciesLists faoSpeciesWithChr keys;
		label: 'Select Organism'.
	self chrList
		label: 'Select Chromosome(s)';
		beMultipleSelection.
	self toolbar
		firstButtonLabel: 'Ok';
		firstButtonAction: [ self window close ];
		secondButtonLabel: 'Cancel';
		secondButtonAction: [ self delete ]