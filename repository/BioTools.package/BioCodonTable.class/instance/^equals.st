comparing
= codonTable
	" Answer <true> if receiver contains the same codon table as codonTable and start/stop codons "

	^ (self table = codonTable table and: [ self startCodons = codonTable startCodons ])
		and: [ self stopCodons = codonTable stopCodons ]