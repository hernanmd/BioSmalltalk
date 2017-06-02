examples
example01

	| vcfReader |
	
	vcfReader := BioVCFFormatter open: self testFilesFullDirectoryName / 'example-4.0.vcf'.
	vcfReader do: [ : vcfRecord |
		Transcript show: vcfRecord; cr ]