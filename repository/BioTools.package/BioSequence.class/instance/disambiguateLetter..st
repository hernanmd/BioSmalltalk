accessing
disambiguateLetter: letter

	^ BioIUPACAmbiguousDNA ambiguousLettersMap 
		keyAtValue: letter asString
		ifAbsent: [ letter asString ]