adding
addVocabulary: vocabulary

	vocabulary documentTermCountDo: [ :document :term :count |
		| row column |
		row := termMap 
			atValue: term 
			ifAbsentPut: [ matrix addRow. matrix rowSize ].
		column := documentMap 
			atValue: document 
			ifAbsentPut: [ matrix addColumn. matrix columnSize ].
		matrix 
			at: row and: column 
			add: count 
		].