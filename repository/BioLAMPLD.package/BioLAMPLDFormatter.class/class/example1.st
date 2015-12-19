examples
example1
	" Export reference alleles "

	BioLAMPLDFormatter new 
		affyTxtFile: 'Exported_Forward-Strand-Base-Call.txt';
		outputFilename: 'refernece-alleles.txt';
		exportFromAffymetrixRefAlleles.
