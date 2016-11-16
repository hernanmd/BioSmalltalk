initialization
initializePresenter
	" Private - See superimplementor's comment "
	
	self organismList 
		whenSelectedItemChanged: [ : selectedOrganism |
			self chrList items: (self chromosomeListFor: selectedOrganism)  ].
	self chrList
		whenMultiSelectionChanged: [ : selection |
			self halt ]