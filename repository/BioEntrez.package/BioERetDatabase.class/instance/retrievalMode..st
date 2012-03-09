accessing retrieval modes
retrievalMode: aString
	" Private - Set the receiver's retrieval mode to aString "
	
	self client addParameters: '&retmode=' , aString