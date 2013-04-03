accessing
alignMaxSize
	"Answer the maximum length of sequences in the alignment "
	
	^ (self sequences detectMax: [ : seq | seq size ]) size