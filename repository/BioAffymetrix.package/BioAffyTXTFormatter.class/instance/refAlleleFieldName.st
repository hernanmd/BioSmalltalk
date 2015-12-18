accessing
refAlleleFieldName
	^ refAlleleFieldName
		ifNil: [ refAlleleFieldName := 'Allele_A' ]