initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		populationNameTextEdit	SpcLabeledTextField
		textFieldForPed				SpcLabeledTextFieldWithBrowseButton					
		textFieldForMap				SpcLabeledTextFieldWithBrowseButton
		toolbar						SpcThreeButtonToolbar).

	self setWidgetProperties.		
	self setFocusOrder.
