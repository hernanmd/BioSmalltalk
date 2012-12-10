accessing
sparseSize

	| tally |
	tally := 0.
	self doSparseWithIndex: [ :each :index | tally := tally + 1 ].
	^tally