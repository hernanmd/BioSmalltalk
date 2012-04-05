accessing
tblastx
	" TBLASTX search translated nucleotide databases using a translated nucleotide query.
	tblastx takes a nucleotide query sequence, translates it in all six frames, and compares those translations to the database sequences dynamically translated in all six frames. This effectively performs a more sensitive blastp search without doing the manual translation.

tblastx gets around the potential frame-shift and ambiguities that may prevent certain open reading frames from being detected. This is very useful in identifying potential proteins encoded by single pass read ESTs. In addition, it can be a good tool for identifying novel genes.

This type of search is computationally intensive and should be used only as last resort. Searching with large genomic queries is NOT recommended. For users with regular or batch need for this time of searches, the best way is to install standalone blast and perform the search locally. For more information on standalone blast, please read the documents for formatdb and standalone BLAST at:

    ftp.ncbi.nlm.nih.gov/blast/documents/formatdb.html
    ftp.ncbi.nlm.nih.gov/blast/documents/netblast.html	 "
	
	self clientUrl addParameters: 'PROGRAM=tblastn'
