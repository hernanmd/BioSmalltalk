accessing
writeSampleRows
	" Private - Write the Admixed Genotype Sample rows "

	| index |
	
	index := 1.
	(self newParserFor: self pedFilePath) rowsDo: [: pedLine |
			self 
				writeGenotypeCode: pedLine 
				referenceAllele: (self referenceAlleleAt: index).
			index := index + 1 ].
