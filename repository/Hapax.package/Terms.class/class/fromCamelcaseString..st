instance creation
fromCamelcaseString: aString

	^((CamelcaseScanner new onString: aString) allTerms) stemAll; removeEnglishStopwords