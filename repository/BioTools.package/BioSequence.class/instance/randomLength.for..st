accessing
randomLength: size for: anAlphabetClass
	" This method modifies the receiver. Set the receiver configured with random residues accordingly anAlphabetClass "
	
	| gen |
	self alphabet: anAlphabetClass.
	gen := (Generator on: [ : g | size timesRepeat: [ (g yield: anAlphabetClass codes atRandom) asString ] ]).
	seq := gen upToEnd
				inject: String new
				into: [ : a : b | String streamContents: [ : stream |
							stream 
								nextPutAll: a;
								nextPutAll: b asString ] ].