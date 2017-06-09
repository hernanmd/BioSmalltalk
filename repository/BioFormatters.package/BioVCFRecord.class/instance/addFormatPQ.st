accessing - format
addFormatPQ
	" Set the phasing quality, the phred-scaled probability that alleles are ordered incorrectly in a heterozygote (against all other members in the phase set). We note that we have not yet included the specific measure for precisely defining 'phasing quality'; our intention for now is simply to reserve the PQ tag for future use as a measure of phasing quality. (Integer) "

	self formats add: 'PQ'
