enumerating
doSparseWithIndex: aBlock

	self doWithIndex: [ :each :index |
		each isZero ifFalse: [ aBlock value: each value: index ]
	].
	^self