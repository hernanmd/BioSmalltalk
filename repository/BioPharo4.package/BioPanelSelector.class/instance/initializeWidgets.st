initialization
initializeWidgets
	" Private - See superimplementor's comment "
	
	super initializeWidgets.
	self instantiateModels: #(selector 	SpcDoubleSelectorList).

	self selector
		dataModel: self dataModel;
		selector: #at:;
		detailSelector: #markersForSpeciesAt:;
		detailListSelector: #supportedSpecies;
		selectionListItems: self dataModelItems;
		secondLabelText: 'Organism';
		label: 'Panel';
		title: 'Panel Selector'