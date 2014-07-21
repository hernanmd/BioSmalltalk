obsolete
fillSpecies: species
	" Private - "
	^ ( BioMatrixFormatter new initMatrixRows: species size columns: 3 )
			 atColumn: 1 fillWith: ((species collect: #names) collect: #asArray);
			 atColumn: 2 fillWith: ((species collect: #synonyms) collect: #asArray);
			 atColumn: 3 fillWith: ((species collect: #locations) collect: #asArray);
			yourself.