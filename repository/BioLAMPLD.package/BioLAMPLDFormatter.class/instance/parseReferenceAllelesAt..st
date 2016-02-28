accessing
parseReferenceAllelesAt: fieldName

	| affyFormatter |
	
	affyFormatter := (BioAffyTXTFormatter newFromInputFile: self inputFile)
			refAlleleFieldName: fieldName;
			yourself.
	^ affyFormatter referenceAlleles joinUsing: Character cr