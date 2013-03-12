menu
bioClassifySelection
	" Private - Build a list of containers for the selected item "
	
	(UITheme builder 
		chooseDropList: 'Select a container' translated
		title: 'Classify'
		list: (self classifier organizationContents collect: #name) )
			ifNotNilDo: [: answer | | org |
				self halt.					
				org := self classifier organizationAt: answer.
				org addClassification: self object.
				self announcer announce: (PCTRemoveItem new object: self object).
				self update].