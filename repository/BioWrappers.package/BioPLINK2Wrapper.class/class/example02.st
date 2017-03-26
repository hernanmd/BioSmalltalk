examples
example02

	BioPLINK2Wrapper new
		file: (self testFilesFullDirectoryName / 'sample_ped') fullName;
		out: 'sample_out';
		referenceAlleles: (self testFilesFullDirectoryName / 'reference_alleles.txt') fullName;
		makeBed;
		execute.