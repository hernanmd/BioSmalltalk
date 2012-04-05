accessing
filterHumanRepeats
	" Filter (Human repeats)

This option masks Human repeats (LINE's, SINE's, plus retroviral repeasts) and is useful for human sequences that may contain these repeats. Filtering for repeats can increase the speed of a search especially with very long sequences (>100 kb) and against databases which contain large number of repeats (htgs). This filter should be checked for genomic queries to prevent potential problems that may arise from the numerous and often spurious matches to those repeat elements.

For more information please see 'Why does my search timeout on the BLAST servers?' in the BLAST Frequently Asked Questions. 

	From: http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#filter "
	
	self clientUrl addParameters: 'FILTER=R'
