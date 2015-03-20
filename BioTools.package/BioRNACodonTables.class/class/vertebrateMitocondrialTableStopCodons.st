tables
vertebrateMitocondrialTableStopCodons
	" Answer the NCBI VM codon table stop codons for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
		with: 'AGA'
		with: 'AGG'