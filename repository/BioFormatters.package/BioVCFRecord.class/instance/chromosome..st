accessing
chromosome: aNumberOrLetter
	" Set a <Number> with the identifier from the reference genome or an angle-bracketed ID String (“<ID>”) pointing to a contig in the assembly file (cf.  the ##assembly line in the header).  All entries for a specific CHROM should form a contiguous block within the VCF file.  The colon symbol (:)  must be absent from all chromosome names to avoid parsing errors when dealing with breakends.  (String, no white-space permitted, Required). "

	chromosome := aNumberOrLetter