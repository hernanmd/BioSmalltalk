accessing public
term: aString
	" Set the receiver's search term "
	
	self client addParameters: '&term=' , aString