class initialization
initialize
	" self initailize "

	super initialize.
	self complementaryTable: 
		(self complementaryTableClass newFromPairs: self complementaryCases).
