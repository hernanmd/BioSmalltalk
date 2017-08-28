initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(toolbar SpcTwoButtonToolbar).
	self toolbar
		firstButtonLabel: 'Ok';
		firstButtonAction: [ self window close ];
		secondButtonLabel: 'Cancel';
		secondButtonAction: [ self delete ].
