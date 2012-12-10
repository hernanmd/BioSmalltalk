enumerating
doSparseWithIndices: trinaryBlock 

	columns doWithIndex: [ :vector :column |
		vector doSparseWithIndex: [ :each :row |
			trinaryBlock value: each value: row value: column 
	]].
	^self