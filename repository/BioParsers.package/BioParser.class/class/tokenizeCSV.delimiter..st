parse-csv
tokenizeCSV: aCSVStringOrStream delimiter: aCharacter
	" Tokenize aString with CSV format "
	
	| parser |
	parser := STextParser on: aCSVStringOrStream.
	parser delimiter: aCharacter.
	^ parser asDictionary