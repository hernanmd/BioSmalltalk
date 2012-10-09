accessing-private
speciesDNALineTokenizer
	" Answer a Parser for parsing the species names line "
	
	^ ((PPPredicateObjectParser anyExceptAnyOf: self speciesFobiddenNames) times: 10) flatten ,
		self dnaInterleaveSequenceTokenizer.