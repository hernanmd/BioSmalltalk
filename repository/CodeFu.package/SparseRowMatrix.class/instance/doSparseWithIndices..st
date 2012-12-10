enumerating
doSparseWithIndices: trinaryBlock 

	rows doWithIndex: [ :vector :row |
		vector doSparseWithIndex: [ :each :column |
			trinaryBlock value: each value: row value: column 
	]].
	^self