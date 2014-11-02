accessing
blastn
	" BLASTN programs search nucleotide databases using a nucleotide query.
	The best way to identify an unknown sequence is to see if that sequence already exists in a public database. If the database sequence is a well-characterized sequence, then one will have access to a wealth of biological information. MEGABLAST, discontiguous-megablast, and blastn all can be used to accomplish this goal. However, MEGABLAST is specifically designed to efficiently find long alignments between very similar sequences and thus is the best tool to use to find the identical match to your query sequence. In addition to the expect value significance cut-off, MEGABLAST also provides an adjustable percent identity cut-off for the alignment, which provides cut-off in addition to the significance cut-off threshold set by Expect value.
	
	See http://www.ncbi.nlm.nih.gov/blast/producttable.shtml#mega for details
	 "
	
	self clientUrl queryAt: 'PROGRAM' put: 'blastn'
