blast
ncbiClientSample04

	| search |
	
	search := 
		BioNCBIWWWBlastWrapper new nucleotide
			query: 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
			hitListSize: 50;
			filterLowComplexity;
			expectValue: 10;
			wordSize: 10;
			blastn;
			blastPlainService;
			alignmentViewFlatQueryAnchored;
			formatTypeXML;			
			fetch.
	self outputToFile: 'blastQuery04.xml' contents: search result.
