testing
hasAmbiguousBases: aString
	" Answer <true> if receiver contains ambiguity codes "

	^ aString asUppercase anySatisfy: [ : letter | self ambiguityCodes includes: letter ]