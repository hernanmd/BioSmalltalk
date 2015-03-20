accessing-parsers
convertAmbiguousToSingleBase: ambTokens
	" Take a String of the form '[A/C]' and convert it to 
	a single base letter as specified by the IUPAC nomenclature.
	Answer a String "
	
	| amb |

	amb := ambTokens allButFirst allButLast.
	" Is using internal delimiters? /, |, etc? "
	^ amb size = 1
		ifTrue: [ self convertContinuousAmbiguousToSingleBase: amb anyOne ]
		ifFalse: [ self convertDelimitedAmbiguousToSingleBase: amb ].