blast
ncbiClientSample03

	| search |
	
	search := 
		BioNCBIWebBlastWrapper new nucleotide
			query: 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
			hitListSize: 10;
			filterLowComplexity;
			expectValue: 10;
			wordSize: 10;
			blastn;
			formatTypeXML;
			alignmentViewFlatQueryAnchoredNoIdentities;
			fetch.
	self outputToFile: 'blastQuery03.xml' contents: search result.
