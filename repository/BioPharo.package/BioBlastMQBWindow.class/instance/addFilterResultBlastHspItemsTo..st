callbacks
addFilterResultBlastHspItemsTo: menu

	menu
		addToggle: 'View alignment lengths' translated
		target: self
		selector: #viewHspAlignLengths
		getStateSelector: nil
		enablementSelector: nil.
	menu
		addToggle: 'View alignment identities' translated
		target: self
		selector: #viewHspIdentities
		getStateSelector: nil
		enablementSelector: nil.
	menu
		addToggle: 'View alignment formatting lines' translated
		target: self
		selector: #viewHspFormattingLines
		getStateSelector: nil
		enablementSelector: nil.
	menu
		addToggle: 'View alignment positive (conservative) substitutions' translated
		target: self
		selector: #viewHspPositives
		getStateSelector: nil
		enablementSelector: nil.

