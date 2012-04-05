accessing
filterMaskForLookup
	" Filter (Mask for lookup table only)

BLAST searches consist of two phases, finding hits based upon a lookup table and then extending them. This option masks only for purposes of constructing the lookup table used by BLAST so that no hits are found based upon low-complexity sequence or repeats (if repeat filter is checked). The BLAST extensions are performed without masking and so they can be extended through low-complexity sequence.

	From: http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#filter  "
	
	self clientUrl addParameters: 'FILTER=m'
