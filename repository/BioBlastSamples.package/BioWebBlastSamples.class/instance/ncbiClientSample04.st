blast
ncbiClientSample04

	| search |
	
	search := 
		BioNCBIWebBlastWrapper new nucleotide
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
	self dumpToFileNamed: 'blastQuery04.xml' contents: search result.
