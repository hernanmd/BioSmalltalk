accessing-private
speciesProteinLineTokenizer
	" Answer a Parser for parsing the species names line "
	
	^ ((PPPredicateObjectParser anyExceptAnyOf: (Array with: Character cr with: Character lf)) times: 10) flatten ,
	#proteinLetter asParser trimBlanks star flatten ==> [: r | r collect: #withoutBlanks ].