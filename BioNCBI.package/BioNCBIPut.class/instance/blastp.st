accessing
blastp
	" BLASTP programs search protein databases using a protein query.
	Standard protein-protein BLAST (blastp) is used for both identifying a query amino acid sequence and for finding similar sequences in protein databases. Like other BLAST programs, blastp is designed to find local regions of similarity. When sequence similarity spans the whole sequence, blastp will also report a global alignment, which is the preferred result for protein identification purposes.

For clear result in identification search, try taking off 'low complexity filter'. Unlike nucleotide BLAST, there is no comparable MEGABLAST for protein searches, so batch search via the web is not supported. To do batch protein BLAST, you can take a look at netblast (blastcl3)	 "
	
	self clientUrl queryAt: 'PROGRAM' put: 'blastp'
