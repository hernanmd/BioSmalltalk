initialize-release
initialize
	" Private - See superimplementor's comment "

	parser := ( self fastaSequenceParser , #newline asParser plus ) plus.
		
