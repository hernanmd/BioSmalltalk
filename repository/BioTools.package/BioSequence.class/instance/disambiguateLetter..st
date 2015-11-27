accessing
disambiguateLetter: letter
	" Private - Answer a <String> of disambiguations for letter "
	
	^ BioIUPACAmbiguousDNA ambiguousLettersMap 
		keyAtValue: letter asString
		ifAbsent: [ letter asString ]