initialization
initializeWidgets
	" Private - See superimplementor's comment "
	
	super initializeWidgets.
	self instantiateModels: #(selector 	SpcSelectorList).

	self selector
		dataModel: self dataModel;
		selector: #at:;
		selectionListItems: self dataModelItems