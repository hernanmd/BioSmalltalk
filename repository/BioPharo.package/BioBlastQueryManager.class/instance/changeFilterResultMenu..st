accessing
changeFilterResultMenu: anObject

	|menu|
	menu := UIManager default
				newMenuIn: self
				for: self.
	menu
		addToggle: 'Browse...' translated
		target: self
		selector: #browseResults
		getStateSelector: nil
		enablementSelector: nil.
	menu
		addToggle: 'Save...' translated
		target: self
		selector: #saveResults
		getStateSelector: nil
		enablementSelector: nil.
	^ menu