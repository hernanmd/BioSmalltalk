parse-csv
tokenizeCSV: aCSVStringOrStream delimiter: aCharacter
	" Tokenize aCSVStringOrStream with CSV format "
	
	^ (NeoCSVReader on: aCSVStringOrStream readStream)
		separator: aCharacter;
		upToEnd