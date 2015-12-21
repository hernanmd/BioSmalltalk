examples
example1
	" Export reference alleles "

	BioLAMPLDFormatter new 
		inputFile: 'Exported_Forward-Strand-Base-Call.txt';
		outputFilename: 'reference-alleles.txt';
		exportFromAffymetrixRefAlleles.
