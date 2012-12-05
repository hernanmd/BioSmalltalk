blast
ncbiClientSample01
"
http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?QUERY=555&DATABASE=nr&HITLIST_SIZE=10&FILTER=L&EXPECT=10&FORMAT_TYPE=HTML&PROGRAM=blastn&CLIENT=web&SERVICE=plain&NCBI_GI=on&PAGE=Nucleotides&CMD=Put
"
	| search |
	
	search := 
		BioNCBIWWWBlastWrapper new nucleotide
			query: '555';
			hitListSize: 10;
			filterLowComplexity;
			expectValue: 10;
			blastn;
			blastPlainService;
			formatTypeXML;
			fetch.
	self outputToFile: 'blastQuery01.xml' contents: search result.

