accessing
randomLength: size for: anAlphabetClass
	" Answer the receiver configured with random residues accordingly anAlphabetClass "
	
	| gen |
	self alphabet: anAlphabetClass.
	gen := ( Generator on: [: g | 
				size timesRepeat: [ ( g yield: anAlphabetClass codes atRandom ) asString ] ] ).
	" '' join: #('a' 'b') "
	seq := gen upToEnd
				inject: String new
				into: [ : a : b | a , b asString ].