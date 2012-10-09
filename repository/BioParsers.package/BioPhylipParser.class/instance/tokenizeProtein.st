accessing-private
tokenizeProtein
	" Private - Tokenize the receiver's epression as Protein data "

	parser := 
		( self firstLineTokenizer ,
		self speciesProteinNamedBlockTokenizer ,
		self proteinInterleaveLineTokenizer ) ==> self buildTokensBlock.
	^ self tokenize.
	