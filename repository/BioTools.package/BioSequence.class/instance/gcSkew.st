accessing
gcSkew
	" Answer a <Collection> with ratios <Float>. Calculate receiver's GC skew (G-C)/(G+C) for windows of size wLength.
	Set 0 for windows without any G/C by handling zero division errors. Does NOT look at any ambiguous nucleotides. "
	
	^ self gcSkew: 1
