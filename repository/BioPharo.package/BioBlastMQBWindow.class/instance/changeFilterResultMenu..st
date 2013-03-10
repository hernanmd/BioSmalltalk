callbacks
changeFilterResultMenu: anObject

	|menu|
	menu := super changeFilterResultMenu: anObject.
	menu
		addToggle: 'GenBank records...' translated
		target: self
		selector: #genBankRecords
		getStateSelector: nil
		enablementSelector: nil.
	self addFilterResultBlastItemsTo: menu.
	^ menu