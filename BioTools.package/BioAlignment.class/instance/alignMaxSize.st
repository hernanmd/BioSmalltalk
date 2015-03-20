accessing
alignMaxSize
	"Answer the maximum length of sequences in the alignment "
	
	^ (self sequences detectMax: #size) size