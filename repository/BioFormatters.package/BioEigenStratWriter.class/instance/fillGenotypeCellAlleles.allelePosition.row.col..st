private
fillGenotypeCellAlleles: alArray allelePosition: alPos row: currentGenoRow col: currentGenoCol

	alArray do: [ : allele | 
		| colPos genoValue |
		genoValue := self genotypeValueAt: alArray.
		(allele = '0' and: [ currentGenoRow = 0 ]) 
			ifTrue: [ colPos := currentGenoRow + 1 ]
			ifFalse: [ colPos := (currentGenoRow + (alPos indexOf: allele)) ].
		self genoMatrix 
			at: colPos 
			at: currentGenoCol 
			put: genoValue ]