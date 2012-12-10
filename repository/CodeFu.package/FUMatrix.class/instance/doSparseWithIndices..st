enumerating
doSparseWithIndices: eachRowColumnBlock 

	self doWithIndices: [ :each :row :column | 
		each isZero ifFalse: [ eachRowColumnBlock value: each value: row value: column]
	].
	^self