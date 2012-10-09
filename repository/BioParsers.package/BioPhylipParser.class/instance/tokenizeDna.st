accessing-private
tokenizeDna
	" Private - Tokenize the receiver's epression as DNA data "

	parser := 
		( self firstLineTokenizer ,
		self speciesDNANamedBlockTokenizer ,
		self dnaInterleaveLineTokenizer ) ==> self buildTokensBlock.
	^ self tokenize.
	
	