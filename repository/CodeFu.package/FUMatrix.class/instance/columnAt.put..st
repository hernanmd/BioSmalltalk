accessing vectorwise
columnAt: columnIndex put: vector

	vector doWithIndex: [ :each :row |
		self at: row and: columnIndex put: each 
	].
	^vector