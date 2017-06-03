accessing
position: aNumber
	" Set a <Number> with the reference position, with the 1st base having position 1.  Positions are sorted numerically, in increasing order, within each reference sequence CHROM. It is permitted to have multiple records with the same POS. Telomeres are indicated by using positions 0 or N+1, where N is the length of the corresponding chromosome or contig.  (Integer, Required) "

	position := aNumber