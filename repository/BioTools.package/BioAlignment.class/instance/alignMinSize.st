accessing
alignMinSize
	"Answer the minimum length of sequences in the alignment "
	
	^ ( self sequences detectMin: [: seq | seq size ] ) size