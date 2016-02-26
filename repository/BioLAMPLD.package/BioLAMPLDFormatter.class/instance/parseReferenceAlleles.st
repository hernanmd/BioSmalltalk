private
parseReferenceAlleles

	^ (BioAffyTXTFormatter newFromInputFile: self inputFile) 
			referenceAlleles joinUsing: Character cr