accessing
keys
	" Answer a <Collection> with the search results keys (node names) "
	
	^ (self keysParserClass parse: self results) parseDocument
