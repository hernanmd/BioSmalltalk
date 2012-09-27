initialize-release
initialize
	" Private - See superimplementor's comment "

	super initialize.
	parser := ( self fastaSequenceParser , #newline asParser plus ) plus.
		
