initialization
initializeWidgets
	" Private - See superimplementor's comment "

	super initializeWidgets.
	self instantiateModels: #(
		organismList 	SpcLabeledList 
		chrList 			SpcLabeledList).
	self organismList
		items: BioSpeciesLists faoSpeciesWithChr keys;
		label: 'Select Organism'.
	self chrList
		label: 'Select Chromosome(s)';
		beMultipleSelection.
