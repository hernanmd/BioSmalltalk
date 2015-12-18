accessing
exportAffymetrixRefAlleles
	" Answer a <String> representing a file with reference alleles taken from Affymetrix full TXT report "

	^ (BioAffyTXTFormatter newFromInputFile: self affyTxtFile) referenceAlleles.