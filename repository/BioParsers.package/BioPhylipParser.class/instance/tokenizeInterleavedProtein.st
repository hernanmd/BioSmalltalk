accessing-protein
tokenizeInterleavedProtein
	" Private - Tokenize the receiver's epression as Protein data "

	parser := 
		self firstLineTokenizer ,
		(((PPPredicateObjectParser anyExceptAnyOf: self speciesFobiddenNames) times: 10) flatten ,
		#proteinLetter asParser trimBlanks star flatten , 
		(#newline asParser answer: nil)) star ,
		( #proteinLetter asParser trimBlanks star flatten , #newline asParser ) star ==> self buildTokensBlock.
	^ self tokenize.
	