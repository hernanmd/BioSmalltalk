accessing
samplesCount
	" Answer the total samples processed "
	
	| total |
	
	total := 0.
	self populations do: [: each |
		each samples do: [: sp |
			total := total + sp frequency. ] ].
	^ total
	