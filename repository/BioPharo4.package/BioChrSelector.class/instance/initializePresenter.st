initialization
initializePresenter

	self organismList 
		whenSelectedItemChanged: [ : selectedOrganism |
			self chrList items: (self chromosomeListFor: selectedOrganism)  ].
