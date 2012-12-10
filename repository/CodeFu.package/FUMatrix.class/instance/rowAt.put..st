accessing vectorwise
rowAt: rowIndex put: vector

	vector doWithIndex: [ :each :column |
		self at: rowIndex and: column put: each 
	].
	^vector