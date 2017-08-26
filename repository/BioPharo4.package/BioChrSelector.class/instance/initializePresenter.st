initialization
initializePresenter
	" Private - See superimplementor's comment "

	self organismList 
		whenSelectedItemChanged: [ : selOrg | self chrList items: (self chromosomeListFor: selOrg) ].
