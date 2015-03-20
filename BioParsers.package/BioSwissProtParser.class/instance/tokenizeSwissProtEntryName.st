accessing
tokenizeSwissProtEntryName
	" Extract the Swiss-Prot entry name from aString "
	
	^ (self expression findTokens: '|') third